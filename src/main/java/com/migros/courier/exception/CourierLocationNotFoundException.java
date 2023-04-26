package com.migros.courier.exception;

import javax.persistence.EntityNotFoundException;

public class CourierLocationNotFoundException extends EntityNotFoundException {
	private static final long serialVersionUID = 1L;

	public CourierLocationNotFoundException(String message) {
		super(message);
	}
}