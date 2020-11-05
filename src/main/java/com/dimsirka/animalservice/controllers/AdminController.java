package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.AdminDto;
import com.dimsirka.animalservice.dtoes.ResetPasswordDto;
import com.dimsirka.animalservice.entities.Admin;
import com.dimsirka.animalservice.mapper.AdminDtoMapper;
import com.dimsirka.animalservice.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("api/admins")
public class AdminController {
    private AdminService adminService;
    private AdminDtoMapper mapper;

    @Autowired
    public AdminController(AdminService adminService, AdminDtoMapper mapper) {
        this.adminService = adminService;
        this.mapper = mapper;
    }

    @PutMapping("/{adminId}")
    @ResponseStatus(HttpStatus.OK)
    public AdminDto update(@Validated @RequestBody AdminDto adminDto, @PathVariable Long adminId){
        adminDto.setId(adminId);
        return mapper.toDto(adminService.update(mapper.toEntity(adminDto)));
    }

    @GetMapping("/{adminId}")
    @ResponseStatus(HttpStatus.OK)
    public AdminDto getById(@PathVariable Long adminId){
        return mapper.toDto(adminService.getById(adminId));
    }

    @PostMapping("/reset-password")
    @ResponseStatus(HttpStatus.OK)
    public void resetPassword(@Validated @RequestBody ResetPasswordDto resetPasswordDto) {
        Admin admin = (Admin) SecurityContextHolder.getContext().getAuthentication().getDetails();
        adminService.resetPassword(admin, resetPasswordDto);
    }
}
