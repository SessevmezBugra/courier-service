package com.migros.courier.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "COURIER_STORE_ENTRANCE_HISTORY")
public class CourierStoreEntranceHistoryEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
    @Column(name="ID")
    @GeneratedValue
    @Type(type="org.hibernate.type.UUIDCharType")
    private UUID id;
	
	@Column(name="STORE_ID")
    @Type(type="org.hibernate.type.UUIDCharType")
	private UUID storeId;
	
	@Column(name="COURIER")
	private String courier;
	
	@Column(name="TIME")
	private LocalDateTime time;
	
}
