package com.workskop.parking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StartController {

    @GetMapping("/")
    public String start(Model model) {
        model.addAttribute("pageContent", "/WEB-INF/views/home/index.jsp");
        return "common/layout";
    }
}
