package com.migros.courier.service.impl;

import java.math.BigDecimal;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.migros.courier.dto.CourierTravelDetailDto;
import com.migros.courier.entity.CourierTravelDetailEntity;
import com.migros.courier.exception.CourierTravelDetailNotFoundException;
import com.migros.courier.repository.CourierTravelDetailRepository;
import com.migros.courier.service.CourierTravelDetailService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourierTravelDetailServiceImpl implements CourierTravelDetailService {

	private final CourierTravelDetailRepository courierTravelDetailRepository;
	private final ModelMapper modelMapper;

	@Transactional(isolation = Isolation.REPEATABLE_READ)
	@Override
	public void addTravelDistance(String courier, BigDecimal distance) {
		Optional<CourierTravelDetailEntity> optCourierTravelDetail = courierTravelDetailRepository
				.findByCourier(courier);
		optCourierTravelDetail.ifPresentOrElse((e) -> {
			BigDecimal totalDistance = e.getTotalDistance().add(distance);
			e.setTotalDistance(totalDistance);
			courierTravelDetailRepository.save(e);
		}, () -> {
			CourierTravelDetailEntity courierTravelDetailEntity = CourierTravelDetailEntity.builder().courier(courier).totalDistance(distance).build();
			courierTravelDetailRepository.save(courierTravelDetailEntity);
		});
	}

	@Override
	public CourierTravelDetailDto findByCourier(String courier) {
		CourierTravelDetailEntity courierTravelDetailEntity = courierTravelDetailRepository.findByCourier(courier).orElseThrow(() -> new CourierTravelDetailNotFoundException("Travel detail not found"));
		return modelMapper.map(courierTravelDetailEntity, CourierTravelDetailDto.class);
	}

}
