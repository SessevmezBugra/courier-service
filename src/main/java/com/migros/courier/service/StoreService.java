package com.migros.courier.service;

import java.util.List;

import com.migros.courier.dto.StoreDto;

public interface StoreService {
	
	public void createStore(StoreDto dto);
	
	public List<StoreDto> findAll();
}
