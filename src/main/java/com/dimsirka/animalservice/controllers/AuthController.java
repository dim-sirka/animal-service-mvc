package com.dimsirka.animalservice.controllers;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    @PostMapping(path = "/admin/logout")
    public void logout() {
        SecurityContextHolder.clearContext();
        //return "redirect:/login";
    }
}
