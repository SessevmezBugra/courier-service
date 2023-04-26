package com.migros.courier.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.migros.courier.entity.CourierLocationEntity;

@Repository
public interface CourierLocationRepository extends JpaRepository<CourierLocationEntity, UUID> {

	Optional<CourierLocationEntity> findByCourier(String courier);
}
