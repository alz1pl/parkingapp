package com.workskop.parking.service;

import com.workskop.parking.entity.ParkingHouse;
import com.workskop.parking.entity.ParkingPlace;
import com.workskop.parking.repository.ParkingHouseRepository;
import com.workskop.parking.repository.ParkingPlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParkingPlaceService {
    @Autowired
    private ParkingPlaceRepository parkingPlaceRepository;

    @Autowired
    private ParkingHouseRepository parkingHouseRepository;

    public List<ParkingPlace> getAllParkingPlaces(Long parkingHouseId) {
                return parkingPlaceRepository.findByParkingHouseId(parkingHouseId);
            }


    public List<ParkingHouse> getAllParkingHouses() {
        return parkingHouseRepository.findAll();
    }

    public ParkingPlace getParkingPlaceById(Long id) {
        return parkingPlaceRepository.findById(id).orElse(null);
    }

    public void createParkingPlace(ParkingPlace parkingPlace) {
        parkingPlaceRepository.save(parkingPlace);
    }

    public void updateParkingPlace(Long id, ParkingPlace parkingPlace) {
        if (parkingPlaceRepository.existsById(id)) {
            parkingPlace.setId(id);
            parkingPlaceRepository.save(parkingPlace);
        }
    }

    public void deleteParkingPlace(Long id) {
        parkingPlaceRepository.deleteById(id);
    }
}
