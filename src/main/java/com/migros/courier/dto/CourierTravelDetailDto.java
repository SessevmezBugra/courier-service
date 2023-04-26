package com.migros.courier.dto;

import java.math.BigDecimal;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CourierTravelDetailDto {

	@Schema(type = "string", example = "TestCourier")
	private String courier;

	private BigDecimal totalDistance;
}
