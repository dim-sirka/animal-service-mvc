package com.dimsirka.animalservice.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

    @GetMapping({"/about"})
    public String getAbout() {
        return "about/about";
    }


}
