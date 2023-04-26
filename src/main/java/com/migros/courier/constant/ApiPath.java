package com.migros.courier.constant;

public final class ApiPath {
	private final static String BASE_PATH = "";
	
	public static final class StoreCtrl {
		public static final String CTRL = BASE_PATH + "/store";
	}
	
	public static final class CourierLocationCtrl {
		public static final String CTRL = BASE_PATH + "/courier-location";
	}
	
	public static final class CourierTravelDetailCtrl {
		public static final String CTRL = BASE_PATH + "/courier-travel-detail";
	}
	
}