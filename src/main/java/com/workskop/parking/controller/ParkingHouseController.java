package com.workskop.parking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.workskop.parking.model.ParkingHouse;
import com.workskop.parking.service.ParkingHouseService;

import java.util.List;

@Controller
@RequestMapping("/parkinghouses")
public class ParkingHouseController {
    @Autowired
    private ParkingHouseService service;

    @GetMapping
    public String getAllParkingHouses(Model model) {
        List<ParkingHouse> parkingHouses = service.getAllParkingHouses();
        model.addAttribute("parkingHouses", parkingHouses);
        return "parkinghouses/index";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("parkingHouse", new ParkingHouse());
        return "parkinghouses/create";
    }

    @PostMapping("/create")
    public String createParkingHouse(@ModelAttribute ParkingHouse parkingHouse) {
        service.createParkingHouse(parkingHouse);
        return "redirect:/parkinghouses";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        ParkingHouse parkingHouse = service.getParkingHouseById(id);
        model.addAttribute("parkingHouse", parkingHouse);
        return "parkinghouses/edit";
    }

    @PostMapping("/edit/{id}")
    public String updateParkingHouse(@PathVariable Long id, @ModelAttribute ParkingHouse parkingHouse) {
        parkingHouse.setId(id);
        service.updateParkingHouse(id, parkingHouse);
        return "redirect:/parkinghouses";
    }

    @GetMapping("/delete/{id}")
    public String deleteParkingHouse(@PathVariable Long id) {
        service.deleteParkingHouse(id);
        return "redirect:/parkinghouses";
    }
}
