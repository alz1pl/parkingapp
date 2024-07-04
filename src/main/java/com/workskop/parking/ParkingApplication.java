package com.workskop.parking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ParkingApplication  extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ParkingApplication.class, args);
    }

}
