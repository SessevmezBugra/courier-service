package com.migros.courier.entity;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "COURIER_LOCATION")
public class CourierLocationEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    @Type(type="org.hibernate.type.UUIDCharType")
    private UUID id;
	
	@Column(name="TIME")
	private LocalDateTime time;
	
	@Column(name="COURIER", unique = true)
	private String courier;
	
	@Column(name="LAT", scale = 7, precision = 9)
    private BigDecimal lat;
	
	@Column(name="LNG", scale = 7, precision = 9)
    private BigDecimal lng;

}
