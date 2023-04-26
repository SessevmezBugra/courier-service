package com.migros.courier.service;

import java.util.UUID;

import com.migros.courier.dto.CourierStoreEntranceHistoryDto;
import com.migros.courier.dto.CreateCourierStoreEntranceHistoryDto;
import com.migros.courier.dto.UpdateCourierStoreEntranceHistoryDto;

public interface CourierStoreEntranceHistoryService {

	public CourierStoreEntranceHistoryDto findByStoreIdAndCourier(UUID storeId, String courier);
	
	public void update(UpdateCourierStoreEntranceHistoryDto dto);
	
	public void create(CreateCourierStoreEntranceHistoryDto dto);
}
