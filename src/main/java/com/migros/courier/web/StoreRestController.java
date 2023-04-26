package com.migros.courier.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.migros.courier.constant.ApiPath;
import com.migros.courier.dto.StoreDto;
import com.migros.courier.service.StoreService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(ApiPath.StoreCtrl.CTRL)
@RequiredArgsConstructor
public class StoreRestController implements SecuredRestController{
	
	private final StoreService storeService;
	
	@RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> createStore(@RequestBody StoreDto dto){
		storeService.createStore(dto);
        return ResponseEntity.ok().build();
    }
	
	@RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<StoreDto>> getAll(){
		return ResponseEntity.ok(storeService.findAll());
    }

}
