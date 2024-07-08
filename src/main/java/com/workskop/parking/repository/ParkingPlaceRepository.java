package com.workskop.parking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.workskop.parking.model.ParkingPlace;

import java.util.List;

@Repository
public interface ParkingPlaceRepository extends JpaRepository<ParkingPlace, Long> {
    List<ParkingPlace> findByParkingHouseId(Long parkingHouseId);
}
