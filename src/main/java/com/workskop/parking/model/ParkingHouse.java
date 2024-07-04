package com.workskop.parking.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "parking_houses")
public class ParkingHouse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "location", nullable = false)
    private String number;

    @OneToMany(mappedBy = "parkingHouse", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ParkingPlace> parkingPlaces;
}
