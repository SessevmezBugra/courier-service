package com.migros.courier.entity;

import java.time.Instant;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Getter;
import lombok.Setter;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
@Setter
public abstract class Auditable<T> {

	@CreatedDate
	@Column(name = "CREATED_DATE")
	protected Instant createdDate;
	
	@CreatedBy
	@Column(name = "CREATED_BY")
	protected T createdBy;
	
	@LastModifiedDate
	@Column(name = "UPDATED_ON")
	protected Instant updatedOn;
	
	@LastModifiedBy
	@Column(name = "UPDATED_BY")
	protected T updatedBy;
	
}