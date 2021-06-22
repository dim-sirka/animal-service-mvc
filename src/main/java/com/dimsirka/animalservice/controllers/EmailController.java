package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.MessageDto;
import com.dimsirka.animalservice.entities.EmailMessageType;
import com.dimsirka.animalservice.services.EmailService;
import com.dimsirka.animalservice.validation.DataValidator;
import com.dimsirka.animalservice.validation.ValidationResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class EmailController {

    @Value("${mail.adminEmail}")
    private String adminEmail;
    private EmailService emailService;

    private DataValidator dataValidator;

    @Autowired
    public EmailController(EmailService emailService, DataValidator dataValidator) {
        this.emailService = emailService;
        this.dataValidator = dataValidator;
    }


    @GetMapping({"/contact"})
    public String getContact() {
        return "contact/contactUs";
    }

    @PostMapping("/message/new")
    public String create(@ModelAttribute MessageDto messageDto, Model model){

        ValidationResult validationResult = dataValidator.validate(messageDto);

        if (validationResult.isError()) {
            model.addAttribute("error", validationResult.getErrorMessage());
            model.addAttribute("contact", messageDto);
            return "contact/contactUs";
        }


        emailService.sendMessage(messageDto, adminEmail);
//        emailService.sendMessage(adminEmail,"", EmailMessageType.ADMIN_MESSAGE);
        model.addAttribute("success", true);
        return "contact/contactUs";
    }
}
