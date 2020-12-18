package com.dimsirka.animalservice.controllers;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @PostMapping("/logout")
    public void logOut (){
        SecurityContextHolder.clearContext();
    }
}