package com.workskop.parking.controller;

import com.workskop.parking.model.User;
import com.workskop.parking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService service;

    @GetMapping
    public String getAllUsers(Model model) {
        List<User> users = service.getAllUsers();
        model.addAttribute("users", users);
        model.addAttribute("pageContent", "/WEB-INF/views/users/index.jsp");
        return "common/layout";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("pageContent", "/WEB-INF/views/users/create.jsp");
        return "common/layout";
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("pageContent", "/WEB-INF/views/users/create.jsp");
            return "common/layout";
        }
        service.createUser(user);
        return "redirect:/users";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        User user = service.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("pageContent", "/WEB-INF/views/users/edit.jsp");
        return "common/layout";
    }

    @PostMapping("/edit/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("user", user);
            model.addAttribute("pageContent", "/WEB-INF/views/users/edit.jsp");
            return "common/layout";
        }
        user.setId(id);
        service.updateUser(id, user);
        return "redirect:/users";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        service.deleteUser(id);
        return "redirect:/users";
    }
}
