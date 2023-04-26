package com.migros.courier.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.migros.courier.constant.ApiPath;
import com.migros.courier.dto.CourierTravelDetailDto;
import com.migros.courier.service.CourierTravelDetailService;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(ApiPath.CourierTravelDetailCtrl.CTRL)
@RequiredArgsConstructor
public class CourierTravelDetailRestController implements SecuredRestController{

	private final CourierTravelDetailService courierTravelDetailService;
	
	@RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<CourierTravelDetailDto> getCourierTravelDetailByCourier(@RequestParam @Schema(type = "string", example = "TestCourier") String courier){
        return ResponseEntity.ok(courierTravelDetailService.findByCourier(courier));
    }
}
