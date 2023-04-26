package com.migros.courier.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.migros.courier.entity.CourierStoreEntranceHistoryEntity;

@Repository
public interface CourierStoreEntranceHistoryRepository extends JpaRepository<CourierStoreEntranceHistoryEntity, UUID> {

	Optional<CourierStoreEntranceHistoryEntity> findByStoreIdAndCourier(UUID storeId, String courier);
}
