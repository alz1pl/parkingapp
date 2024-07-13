package com.workskop.parking.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.workskop.parking.entity.ParkingHouse;
import com.workskop.parking.repository.ParkingHouseRepository;

import java.util.List;

@Service
public class ParkingHouseService {
    @Autowired
    private ParkingHouseRepository repository;

    public List<ParkingHouse> getAllParkingHouses() {
        return repository.findAll();
    }

    public ParkingHouse getParkingHouseById(Long id) {
        return repository.findById(id).orElse(null);
    }

    public ParkingHouse createParkingHouse(ParkingHouse parkingHouse) {
        return repository.save(parkingHouse);
    }

    public ParkingHouse updateParkingHouse(Long id, ParkingHouse parkingHouse) {
        parkingHouse.setId(id);
        return repository.save(parkingHouse);
    }

    public void deleteParkingHouse(Long id) {
        repository.deleteById(id);
    }
}
