package com.dimsirka.animalservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@SpringBootApplication
public class AnimalServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(AnimalServiceApplication.class, args);
    }

}
