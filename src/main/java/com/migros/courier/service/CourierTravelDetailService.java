package com.migros.courier.service;

import java.math.BigDecimal;

import com.migros.courier.dto.CourierTravelDetailDto;

public interface CourierTravelDetailService {

	public void addTravelDistance(String courier, BigDecimal distance);
	
	public CourierTravelDetailDto findByCourier(String courier);
}
