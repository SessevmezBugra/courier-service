package com.migros.courier.service.impl;

import java.util.Arrays;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.migros.courier.dto.StoreDto;
import com.migros.courier.entity.StoreEntity;
import com.migros.courier.repository.StoreRepository;
import com.migros.courier.service.StoreService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StoreServiceImpl implements StoreService {

	private final StoreRepository storeRepository;
	private final ModelMapper modelMapper;
	
	@Override
	public void createStore(StoreDto dto) {
		StoreEntity storeEntity = modelMapper.map(dto, StoreEntity.class);
		storeRepository.save(storeEntity);
	}

	@Cacheable(value = "stores")
	@Override
	public List<StoreDto> findAll() {
		return Arrays.asList(modelMapper.map(storeRepository.findAll(), StoreDto[].class));
	}

}
