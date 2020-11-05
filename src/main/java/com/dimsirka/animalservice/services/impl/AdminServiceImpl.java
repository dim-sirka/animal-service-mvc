package com.dimsirka.animalservice.services.impl;

import com.dimsirka.animalservice.dtoes.ResetPasswordDto;
import com.dimsirka.animalservice.entities.Admin;
import com.dimsirka.animalservice.exceptions.AdminNotFoundException;
import com.dimsirka.animalservice.repositories.AdminRepository;
import com.dimsirka.animalservice.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
    private AdminRepository adminRepository;
    private PasswordEncoder encoder;

    @Autowired
    public AdminServiceImpl(AdminRepository adminRepository, PasswordEncoder encoder) {
        this.adminRepository = adminRepository;
        this.encoder = encoder;
    }

    @Override
    public Admin create(Admin admin) {
        String encodedPassword = encoder.encode(admin.getPassword());
        admin.setPassword(encodedPassword);
        return adminRepository.save(admin);
    }

    @Override
    public Admin update(Admin admin) {
        Admin persistentAdmin = getById(admin.getId());
        persistentAdmin.setBankAccount(admin.getBankAccount());
        persistentAdmin.setFirstName(admin.getFirstName());
        persistentAdmin.setLastName(admin.getLastName());
        persistentAdmin.setEmail(admin.getEmail());
        return adminRepository.save(persistentAdmin);
    }

    @Override
    public Admin getById(Long id) {
        return adminRepository.findById(id)
                .orElseThrow(()-> new AdminNotFoundException("Admin with a specified id isn't found!"));
    }

    @Override
    public Admin getByEmail(String email) {
        return adminRepository.findAdminByEmail(email)
                .orElseThrow(()->new AdminNotFoundException("Admin with a specified username isn't found!"));
    }

    @Override
    public void resetPassword(Admin admin, ResetPasswordDto resetPasswordDto) {
        if (!encoder.matches(resetPasswordDto.getOldPassword(), admin.getPassword())) {
            throw new IllegalArgumentException("Incorrect an old password provided");
        }
        admin.setPassword(encoder.encode(resetPasswordDto.getNewPassword()));
        adminRepository.save(admin);
    }
}