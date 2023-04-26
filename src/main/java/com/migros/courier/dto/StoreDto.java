package com.migros.courier.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.UUID;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class StoreDto implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private UUID id;
	
	private String name;

    private BigDecimal lat;
	
    private BigDecimal lng;
}
