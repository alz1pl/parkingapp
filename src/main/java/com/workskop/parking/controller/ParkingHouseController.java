package com.workskop.parking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.workskop.parking.entity.ParkingHouse;
import com.workskop.parking.service.ParkingHouseService;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/parkinghouses")
public class ParkingHouseController {
    @Autowired
    private ParkingHouseService service;

    @GetMapping
    public String getAllParkingHouses(Model model) {
        List<ParkingHouse> parkingHouses = service.getAllParkingHouses();
        Map<Long, Long> parkingPlacesCount = parkingHouses.stream()
                .collect(Collectors.toMap(
                        ParkingHouse::getId,
                        ph -> (long) ph.getParkingPlaces().size()
                ));
        model.addAttribute("parkingHouses", parkingHouses);
        model.addAttribute("parkingPlacesCount", parkingPlacesCount);
        model.addAttribute("pageContent", "/WEB-INF/views/parkinghouses/index.jsp");
        return "common/layout";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("parkingHouse", new ParkingHouse());
        model.addAttribute("pageContent", "/WEB-INF/views/parkinghouses/create.jsp");
        return "common/layout";
    }
    @PostMapping("/create")
    public String createParkingHouse(@ModelAttribute @Valid ParkingHouse parkingHouse, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("pageContent", "/WEB-INF/views/parkinghouses/create.jsp");
            return "common/layout";
        }
        service.createParkingHouse(parkingHouse);
        return "redirect:/parkinghouses";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        ParkingHouse parkingHouse = service.getParkingHouseById(id);
        model.addAttribute("parkingHouse", parkingHouse);
        model.addAttribute("pageContent", "/WEB-INF/views/parkinghouses/edit.jsp");
        return "common/layout";
    }

    @PostMapping("/edit/{id}")
    public String updateParkingHouse(@PathVariable Long id, @ModelAttribute @Valid ParkingHouse parkingHouse, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("parkingHouse", parkingHouse);
            model.addAttribute("pageContent", "/WEB-INF/views/parkinghouses/edit.jsp");
            return "common/layout";
        }
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
