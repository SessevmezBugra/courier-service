package com.migros.courier.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonFormat;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CourierLocationDto extends BaseDto<String>{

	private UUID id;
	
	@Schema(type = "string", example = "dd/MM/yyyy HH:mm")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
	private LocalDateTime time;
	
	@Schema(type = "string", example = "TestCourier")
	private String courier;

    private BigDecimal lat;
	
    private BigDecimal lng;
}
