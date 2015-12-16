package com.anhanguera.cp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import javax.inject.Inject;

@SpringBootApplication
@EnableAutoConfiguration
@EnableJpaRepositories(basePackages = "com.anhanguera.cp.infra")
@ComponentScan(basePackages = {"com.anhanguera.cp"})
public class SimuladoEnadeApplication {

    public static void main(String[] args) {
        SpringApplication.run(SimuladoEnadeApplication.class, args);


    }

}
