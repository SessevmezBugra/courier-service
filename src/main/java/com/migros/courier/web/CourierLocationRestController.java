package com.migros.courier.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.migros.courier.constant.ApiPath;
import com.migros.courier.dto.UpdateCourierLocationDto;
import com.migros.courier.service.CourierLocationService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(ApiPath.CourierLocationCtrl.CTRL)
@RequiredArgsConstructor
public class CourierLocationRestController implements SecuredRestController{
	
	private final CourierLocationService courierLocationService;
	
	@RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<Void> updateCourierLocation(@RequestBody UpdateCourierLocationDto dto){
		courierLocationService.updateCourierLocation(dto);
        return ResponseEntity.ok().build();
    }
}
