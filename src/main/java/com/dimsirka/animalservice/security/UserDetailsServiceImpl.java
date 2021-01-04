package com.dimsirka.animalservice.security;

import com.dimsirka.animalservice.entities.Admin;
import com.dimsirka.animalservice.repositories.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private AdminRepository adminRepository;

    @Autowired
    public UserDetailsServiceImpl(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<Admin> optional = adminRepository.getByEmail(email);
        return !optional.isPresent() ? null : new UserDetailsImpl(optional.get());
    }
}
