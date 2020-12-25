package com.dimsirka.animalservice.controllers;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping(path = "/logout")
    public void logout() {
        SecurityContextHolder.clearContext();
        //return "redirect:/login";
    }
}
