package com.migros.courier.exception;

import javax.persistence.EntityNotFoundException;

public class CourierStoreEntranceHistoryNotFoundException extends EntityNotFoundException {
	private static final long serialVersionUID = 1L;

	public CourierStoreEntranceHistoryNotFoundException(String message) {
		super(message);
	}
}
