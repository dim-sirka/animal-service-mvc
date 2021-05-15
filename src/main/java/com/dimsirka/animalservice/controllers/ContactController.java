package com.dimsirka.animalservice.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ContactController {

    @GetMapping({"/contact"})
    public String getAll() {
        return "contact/contactUs";
    }


}
