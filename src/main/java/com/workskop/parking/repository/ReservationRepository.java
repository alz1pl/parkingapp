package com.workskop.parking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.workskop.parking.entity.Reservation;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> findByStartTimeLessThanEqualAndEndTimeGreaterThanEqual(LocalDateTime endTime, LocalDateTime startTime);
}
