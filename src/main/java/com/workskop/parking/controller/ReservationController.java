package com.workskop.parking.controller;

import com.workskop.parking.model.ParkingPlace;
import com.workskop.parking.model.Reservation;
import com.workskop.parking.model.User;
import com.workskop.parking.model.UserType;
import com.workskop.parking.service.ParkingPlaceService;
import com.workskop.parking.service.ReservationService;
import com.workskop.parking.service.UserService;
import com.workskop.parking.service.ParkingHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private UserService userService;

    @Autowired
    private ParkingHouseService parkingHouseService;

    @Autowired
    private ParkingPlaceService parkingPlaceService;

    @GetMapping
    public String getAllReservations(Model model) {
        List<Reservation> reservations = reservationService.getAllReservations();
        model.addAttribute("reservations", reservations);
        model.addAttribute("pageContent", "/WEB-INF/views/reservations/index.jsp");
        return "common/layout";
    }

    @GetMapping("/search_places")
    public String showSearchForm(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("parkingHouses", parkingHouseService.getAllParkingHouses());
        model.addAttribute("pageContent", "/WEB-INF/views/reservations/search_places.jsp");
        return "common/layout";
    }

    @PostMapping("/show_available_places")
    public String searchAvailableParking(@RequestParam("parkingHouseId") Long parkingHouseId,
                                         @RequestParam("userId") Long userId,
                                         @RequestParam("startTime") String startTime,
                                         @RequestParam("endTime") String endTime,
                                         Model model) {
        LocalDateTime start = LocalDateTime.parse(startTime);
        LocalDateTime end = LocalDateTime.parse(endTime);

        User user = userService.getUserById(userId);

        if (user.getType() == UserType.LIMITED) {
            LocalDateTime maxAllowedDate = LocalDateTime.now().plus(1, ChronoUnit.WEEKS);
            if (start.isAfter(maxAllowedDate) || end.isAfter(maxAllowedDate)) {
                model.addAttribute("error", "Limited users can only make reservations up to one week in advance.");
                model.addAttribute("users", userService.getAllUsers());
                model.addAttribute("parkingHouses", parkingHouseService.getAllParkingHouses());
                model.addAttribute("pageContent", "/WEB-INF/views/reservations/search_places.jsp");
                return "common/layout";
            }
        }

        List<ParkingPlace> availableParkingPlaces = reservationService.getAvailableParkingPlaces(parkingHouseId, start, end);

        model.addAttribute("availableParkingPlaces", availableParkingPlaces);
        model.addAttribute("user", user);
        model.addAttribute("parkingHouse", parkingHouseService.getParkingHouseById(parkingHouseId));
        model.addAttribute("startTime", start);
        model.addAttribute("endTime", end);
        model.addAttribute("pageContent", "/WEB-INF/views/reservations/show_available_places.jsp");

        return "common/layout";
    }

    @PostMapping("/create")
    public String createReservation(@RequestParam("parkingPlaceId") Long parkingPlaceId,
                                    @RequestParam("userId") Long userId,
                                    @RequestParam("startTime") String startTime,
                                    @RequestParam("endTime") String endTime,
                                    Model model) {

        LocalDateTime start = LocalDateTime.parse(startTime);
        LocalDateTime end = LocalDateTime.parse(endTime);

        if (!reservationService.isParkingPlaceAvailable(parkingPlaceId, start, end)) {
            model.addAttribute("error", "Selected parking place is not available for the specified time range.");
            return "common/layout";
        }

        Reservation reservation = new Reservation();
        reservation.setUser(userService.getUserById(userId));
        reservation.setParkingPlace(parkingPlaceService.getParkingPlaceById(parkingPlaceId));
        reservation.setStartTime(start);
        reservation.setEndTime(end);

        reservationService.saveReservation(reservation);

        return "redirect:/reservations";
    }

    @GetMapping("/delete/{id}")
    public String deleteReservation(@PathVariable Long id) {
        reservationService.deleteReservation(id);
        return "redirect:/reservations";
    }
}
