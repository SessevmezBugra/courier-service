package com.migros.courier.service;

import com.migros.courier.dto.CourierLocationDto;
import com.migros.courier.dto.UpdateCourierLocationDto;

public interface CourierLocationService {

	public void updateCourierLocation(UpdateCourierLocationDto dto);
	
	public CourierLocationDto findByCourier(String courier);
}
