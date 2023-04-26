package com.migros.courier.exception;

import javax.persistence.EntityNotFoundException;

public class CourierTravelDetailNotFoundException extends EntityNotFoundException {
	private static final long serialVersionUID = 1L;

	public CourierTravelDetailNotFoundException(String message) {
		super(message);
	}
}