package com.workskop.parking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.workskop.parking.entity.ParkingHouse;

@Repository
public interface ParkingHouseRepository extends JpaRepository<ParkingHouse, Long> {
}
