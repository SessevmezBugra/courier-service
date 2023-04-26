package com.migros.courier.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public abstract class BaseDto<T> {

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "tr-TR")
	protected Date createdDate;

	protected T createdBy;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "tr-TR")
	protected Date updatedOn;

	protected T updatedBy;
}
