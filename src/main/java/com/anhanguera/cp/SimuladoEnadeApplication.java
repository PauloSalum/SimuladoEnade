package com.anhanguera.cp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.anhanguera.cp.repositories")
public class SimuladoEnadeApplication {

  public static void main(String[] args) {
    SpringApplication.run(SimuladoEnadeApplication.class, args);
  }
}
