package com.dimsirka.animalservice.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class TempController {

    @GetMapping({"/temp"})
    public String getAll() {
        return "animal/dropdownItem";
    }


}

