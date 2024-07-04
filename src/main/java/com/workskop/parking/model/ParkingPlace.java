package com.workskop.parking.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "parking_places")
public class ParkingPlace {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "number", nullable = false)
    private String number;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parking_house_id", nullable = false)
    private ParkingHouse parkingHouse;

    @OneToMany(mappedBy = "parkingPlace", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Reservation> reservations;
}
