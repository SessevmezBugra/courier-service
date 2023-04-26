package com.migros.courier.service.impl;

import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.migros.courier.dto.CourierLocationDto;
import com.migros.courier.dto.UpdateCourierLocationDto;
import com.migros.courier.entity.CourierLocationEntity;
import com.migros.courier.exception.CourierLocationNotFoundException;
import com.migros.courier.repository.CourierLocationRepository;
import com.migros.courier.service.CourierLocationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CourierLocationServiceImpl implements CourierLocationService {

	private final CourierLocationRepository courierLocationRepository;
	private final ModelMapper modelMapper;

	@Transactional(isolation = Isolation.REPEATABLE_READ)
	@Override
	public void updateCourierLocation(UpdateCourierLocationDto dto) {
		Optional<CourierLocationEntity> optCourierLocation = findCourierLocationEntityByCourier(dto.getCourier());
		optCourierLocation.ifPresentOrElse((foundCourierLocation) -> {
			foundCourierLocation.setLat(dto.getLat());
			foundCourierLocation.setLng(dto.getLng());
			foundCourierLocation.setTime(dto.getTime());
			courierLocationRepository.save(foundCourierLocation);
		}, () -> {
			CourierLocationEntity newCourierLocation = modelMapper.map(dto, CourierLocationEntity.class);
			courierLocationRepository.save(newCourierLocation);
		});
	}

	private Optional<CourierLocationEntity> findCourierLocationEntityByCourier(String courier) {
		Optional<CourierLocationEntity> optCourierLocation = courierLocationRepository.findByCourier(courier);
		return optCourierLocation;
	}

	@Override
	public CourierLocationDto findByCourier(String courier) {
		CourierLocationEntity courierLocationEntity = findCourierLocationEntityByCourier(courier).orElseThrow(() -> new CourierLocationNotFoundException("Location not found"));
		return modelMapper.map(courierLocationEntity, CourierLocationDto.class);
	}

}
