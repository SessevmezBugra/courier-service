package com.migros.courier.aspect;

import java.math.BigDecimal;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.migros.courier.dto.CourierLocationDto;
import com.migros.courier.dto.CourierStoreEntranceHistoryDto;
import com.migros.courier.dto.CreateCourierStoreEntranceHistoryDto;
import com.migros.courier.dto.StoreDto;
import com.migros.courier.dto.UpdateCourierLocationDto;
import com.migros.courier.dto.UpdateCourierStoreEntranceHistoryDto;
import com.migros.courier.exception.CourierLocationNotFoundException;
import com.migros.courier.exception.CourierStoreEntranceHistoryNotFoundException;
import com.migros.courier.service.CourierLocationService;
import com.migros.courier.service.CourierStoreEntranceHistoryService;
import com.migros.courier.service.CourierTravelDetailService;
import com.migros.courier.service.StoreService;
import com.migros.courier.util.LocationUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
@RequiredArgsConstructor
public class CourierAspect {

	private final CourierStoreEntranceHistoryService courierStoreEntranceHistoryService;
	private final StoreService storeService;
	private final CourierTravelDetailService courierTravelDetailService;
	private final CourierLocationService courierLocationService;

	@Pointcut("execution(* com.migros.courier.service.CourierLocationService.updateCourierLocation(..))")
	public void updateCourierLocationPointcut() {
	}

	@Before("updateCourierLocationPointcut()")
	public void logCourierActionAndSaveNewEntrance(JoinPoint jp) {
		UpdateCourierLocationDto newCourierLocation = (UpdateCourierLocationDto) jp.getArgs()[0];
		Optional<StoreDto> optStoreIn100 = findStoreIn100MetersByLocation(newCourierLocation.getLat(),
				newCourierLocation.getLng());
		optStoreIn100.ifPresent((store) -> {
			try {
				final CourierStoreEntranceHistoryDto lastEntranceToStore = courierStoreEntranceHistoryService
						.findByStoreIdAndCourier(store.getId(), newCourierLocation.getCourier());
				long minutes = ChronoUnit.MINUTES.between(lastEntranceToStore.getTime(), newCourierLocation.getTime());
				if (minutes > 1) {
					log.info("New Entrance to {} by {}", store.getName(), newCourierLocation.getCourier());
					UpdateCourierStoreEntranceHistoryDto newEntrance = UpdateCourierStoreEntranceHistoryDto.builder()
							.courier(lastEntranceToStore.getCourier()).storeId(lastEntranceToStore.getStoreId())
							.time(newCourierLocation.getTime()).build();
					courierStoreEntranceHistoryService.update(newEntrance);
				} else {
					log.info("It is not new Entrance to {} by {} since it has been entrance {} minutes ago",
							store.getName(), newCourierLocation.getCourier(), minutes);
				}
			} catch (CourierStoreEntranceHistoryNotFoundException e) {
				log.info("New Entrance to {} by {}", store.getName(), newCourierLocation.getCourier());
				CreateCourierStoreEntranceHistoryDto newHistory = CreateCourierStoreEntranceHistoryDto.builder()
						.courier(newCourierLocation.getCourier()).storeId(store.getId())
						.time(newCourierLocation.getTime()).build();
				courierStoreEntranceHistoryService.create(newHistory);
			}
		});
	}

	private Optional<StoreDto> findStoreIn100MetersByLocation(BigDecimal lat, BigDecimal lng) {
		List<StoreDto> storeDtos = storeService.findAll();
		return storeDtos.parallelStream().filter(store -> {
			double distance = LocationUtil.distance(store.getLat().doubleValue(), lat.doubleValue(),
					store.getLng().doubleValue(), lng.doubleValue());
			log.info("Distance from {} to courier: {} KM. Is distance enough: {} ", store.getName(), distance,
					distance < 0.1);
			return distance < 0.1;
		}).findFirst();
	}

	@Before("updateCourierLocationPointcut()")
	public void sumCourierTotalDistance(JoinPoint jp) {
		UpdateCourierLocationDto newCourierLocation = (UpdateCourierLocationDto) jp.getArgs()[0];
		try {
			CourierLocationDto lastCourierLocation = courierLocationService
					.findByCourier(newCourierLocation.getCourier());
			double distance = LocationUtil.distance(lastCourierLocation.getLat().doubleValue(),
					newCourierLocation.getLat().doubleValue(), lastCourierLocation.getLng().doubleValue(),
					newCourierLocation.getLng().doubleValue());
			courierTravelDetailService.addTravelDistance(newCourierLocation.getCourier(), BigDecimal.valueOf(distance));
			log.info("New distance: {} by previous location for {}", distance, newCourierLocation.getCourier());
		} catch (CourierLocationNotFoundException e) {
			log.info("First location for courier: {}", newCourierLocation.getCourier());
		}
	}

}
