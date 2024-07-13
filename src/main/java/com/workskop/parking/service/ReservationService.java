package com.workskop.parking.service;

import com.workskop.parking.entity.ParkingPlace;
import com.workskop.parking.entity.Reservation;
import com.workskop.parking.repository.ParkingPlaceRepository;
import com.workskop.parking.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReservationService {

    private static final Logger logger = LoggerFactory.getLogger(ReservationService.class);

    @Autowired
    private ReservationRepository reservationRepository;

    @Autowired
    private ParkingPlaceRepository parkingPlaceRepository;

    public List<ParkingPlace> getAvailableParkingPlaces(Long parkingHouseId, LocalDateTime startTime, LocalDateTime endTime) {
        List<Reservation> overlappingReservations = reservationRepository.findByStartTimeLessThanEqualAndEndTimeGreaterThanEqual(endTime, startTime);

        List<Long> occupiedParkingPlaceIds = overlappingReservations.stream()
                .map(reservation -> {
                    Long parkingPlaceId = reservation.getParkingPlace().getId();
                    logger.info("Parking place ID {} is occupied", parkingPlaceId);
                    return parkingPlaceId;
                })
                .collect(Collectors.toList());

        List<ParkingPlace> availableParkingPlaces;

        if (occupiedParkingPlaceIds.isEmpty()) {
            availableParkingPlaces = parkingPlaceRepository.findByParkingHouseId(parkingHouseId);
        } else {
            availableParkingPlaces = parkingPlaceRepository.findByIdNotInAndParkingHouseId(occupiedParkingPlaceIds, parkingHouseId);
        }

        return availableParkingPlaces;
    }

    public boolean isParkingPlaceAvailable(Long parkingPlaceId, LocalDateTime startTime, LocalDateTime endTime) {
        Long parkingHouseId = parkingPlaceRepository.findById(parkingPlaceId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid parking place ID"))
                .getParkingHouse().getId();
        List<ParkingPlace> availableParkingPlaces = getAvailableParkingPlaces(parkingHouseId, startTime, endTime);
        return availableParkingPlaces.stream().anyMatch(parkingPlace -> parkingPlace.getId().equals(parkingPlaceId));
    }

    public Reservation saveReservation(Reservation reservation) {
        return reservationRepository.save(reservation);
    }

    public List<Reservation> getAllReservations() {
        return reservationRepository.findAll();
    }

    public Reservation getReservationById(Long id) {
        return reservationRepository.findById(id).orElse(null);
    }

    public void deleteReservation(Long id) {
        reservationRepository.deleteById(id);
    }
}
