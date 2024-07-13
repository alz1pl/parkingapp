package com.workskop.parking.controller;

import com.workskop.parking.entity.ParkingHouse;
import com.workskop.parking.entity.ParkingPlace;
import com.workskop.parking.service.ParkingPlaceService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/parkingplaces")
public class ParkingPlaceController {
    @Autowired
    private ParkingPlaceService parkingPlaceService;

    @GetMapping
    public String getAllParkingPlaces(@RequestParam(required = false) Long parkingHouseId, Model model) {
        List<ParkingHouse> parkingHouses = parkingPlaceService.getAllParkingHouses();
        model.addAttribute("parkingHouses", parkingHouses);

        if (parkingHouseId != null) {
            List<ParkingPlace> parkingPlaces = parkingPlaceService.getAllParkingPlaces(parkingHouseId);
            model.addAttribute("parkingPlaces", parkingPlaces);
        }

        model.addAttribute("pageContent", "/WEB-INF/views/parkingplaces/index.jsp");
        return "common/layout";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("parkingPlace", new ParkingPlace());
        model.addAttribute("parkingHouses", parkingPlaceService.getAllParkingHouses());
        model.addAttribute("pageContent", "/WEB-INF/views/parkingplaces/create.jsp");
        return "common/layout";
    }

    @PostMapping("/create")
    public String createParkingPlace(@ModelAttribute @Valid ParkingPlace parkingPlace, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("parkingHouses", parkingPlaceService.getAllParkingHouses());
            model.addAttribute("pageContent", "/WEB-INF/views/parkingplaces/create.jsp");
            return "common/layout";
        }
        parkingPlaceService.createParkingPlace(parkingPlace);
        return "redirect:/parkingplaces";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        ParkingPlace parkingPlace = parkingPlaceService.getParkingPlaceById(id);
        model.addAttribute("parkingPlace", parkingPlace);
        model.addAttribute("parkingHouses", parkingPlaceService.getAllParkingHouses());
        model.addAttribute("pageContent", "/WEB-INF/views/parkingplaces/edit.jsp");
        return "common/layout";
    }

    @PostMapping("/edit/{id}")
    public String updateParkingPlace(@PathVariable Long id, @ModelAttribute @Valid ParkingPlace parkingPlace, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("parkingPlace", parkingPlace);
            model.addAttribute("parkingHouses", parkingPlaceService.getAllParkingHouses());
            model.addAttribute("pageContent", "/WEB-INF/views/parkingplaces/edit.jsp");
            return "common/layout";
        }
        parkingPlaceService.updateParkingPlace(id, parkingPlace);
        return "redirect:/parkingplaces";
    }

    @GetMapping("/delete/{id}")
    public String deleteParkingPlace(@PathVariable Long id) {
        parkingPlaceService.deleteParkingPlace(id);
        return "redirect:/parkingplaces";
    }
}
