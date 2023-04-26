package com.migros.courier.dto;

import java.math.BigDecimal;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CreateStoreDto {

	private String name;

    private BigDecimal lat;
	
    private BigDecimal lng;
}
