package com.migros.courier;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableCaching
@EnableAspectJAutoProxy
@EnableJpaAuditing
@SpringBootApplication
public class CourierServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(CourierServiceApplication.class, args);
	}

}
