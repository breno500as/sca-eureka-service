package com.puc.sca.eureka.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class ScaEurekaServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ScaEurekaServiceApplication.class, args);
	}

}
