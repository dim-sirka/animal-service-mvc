package com.dimsirka.animalservice.mapper;

import com.dimsirka.animalservice.dtoes.AdminDto;
import com.dimsirka.animalservice.entities.Admin;
import org.springframework.stereotype.Component;

@Component
public class AdminDtoMapper implements EntityDtoMapper<Admin, AdminDto> {
    @Override
    public AdminDto toDto(Admin admin){
        return AdminDto.builder()
                .bankAccount(admin.getBankAccount())
                .email(admin.getEmail())
                .firstName(admin.getFirstName())
                .lastName(admin.getLastName())
                .createdDate(admin.getCreatedDate())
                .updatedDate(admin.getUpdatedDate())
                .id(admin.getId()).build();
    }

    public Admin toEntity(AdminDto admin){
        return Admin.builder()
                .id(admin.getId())
                .bankAccount(admin.getBankAccount())
                .email(admin.getEmail())
                .firstName(admin.getFirstName())
                .lastName(admin.getLastName())
                .password(admin.getPassword()).build();
    }


}
