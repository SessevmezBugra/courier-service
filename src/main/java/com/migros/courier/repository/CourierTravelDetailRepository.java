package com.migros.courier.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.migros.courier.entity.CourierTravelDetailEntity;

@Repository
public interface CourierTravelDetailRepository extends JpaRepository<CourierTravelDetailEntity, UUID> {

	Optional<CourierTravelDetailEntity> findByCourier(String courier);
}
