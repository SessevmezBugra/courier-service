package com.migros.courier.service.impl;

import java.util.UUID;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.migros.courier.dto.CourierStoreEntranceHistoryDto;
import com.migros.courier.dto.CreateCourierStoreEntranceHistoryDto;
import com.migros.courier.dto.UpdateCourierStoreEntranceHistoryDto;
import com.migros.courier.entity.CourierStoreEntranceHistoryEntity;
import com.migros.courier.exception.CourierStoreEntranceHistoryNotFoundException;
import com.migros.courier.repository.CourierStoreEntranceHistoryRepository;
import com.migros.courier.service.CourierStoreEntranceHistoryService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourierStoreEntranceHistoryServiceImpl implements CourierStoreEntranceHistoryService {

	private final CourierStoreEntranceHistoryRepository courierStoreEntranceHistoryRepository;
	private final ModelMapper modelMapper;
	
	@Override
	public CourierStoreEntranceHistoryDto findByStoreIdAndCourier(UUID storeId, String courier) {
		 CourierStoreEntranceHistoryEntity foundEntity = findEntityByStoreIdAndCourier(storeId, courier);
		return modelMapper.map(foundEntity, CourierStoreEntranceHistoryDto.class);
	}

	@Transactional(isolation = Isolation.REPEATABLE_READ)
	@Override
	public void update(UpdateCourierStoreEntranceHistoryDto dto) {
		CourierStoreEntranceHistoryEntity foundCourierStoreEntranceHistoryEntity = findEntityByStoreIdAndCourier(dto.getStoreId(), dto.getCourier());
		foundCourierStoreEntranceHistoryEntity.setTime(dto.getTime());
		courierStoreEntranceHistoryRepository.save(foundCourierStoreEntranceHistoryEntity);
	}

	@Override
	public void create(CreateCourierStoreEntranceHistoryDto dto) {
		CourierStoreEntranceHistoryEntity courierStoreEntranceHistoryEntity = CourierStoreEntranceHistoryEntity
				.builder()
				.courier(dto.getCourier())
				.storeId(dto.getStoreId())
				.time(dto.getTime())
				.build();
		courierStoreEntranceHistoryRepository.save(courierStoreEntranceHistoryEntity);
	}
	
	private CourierStoreEntranceHistoryEntity findEntityByStoreIdAndCourier(UUID storeId, String courier) {
		CourierStoreEntranceHistoryEntity foundEntity = courierStoreEntranceHistoryRepository
				.findByStoreIdAndCourier(storeId, courier)
				.orElseThrow(() -> new CourierStoreEntranceHistoryNotFoundException("History not found"));
		return foundEntity;
	}

} 
