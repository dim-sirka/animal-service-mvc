package com.dimsirka.animalservice.services.impl;

import com.dimsirka.animalservice.dtoes.LoginDto;
import com.dimsirka.animalservice.entities.Admin;
import com.dimsirka.animalservice.entities.Token;
import com.dimsirka.animalservice.exceptions.BadAdminCredentialsException;
import com.dimsirka.animalservice.repositories.TokenRepository;
import com.dimsirka.animalservice.services.AdminService;
import com.dimsirka.animalservice.services.AuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@Slf4j
public class AuthServiceImpl implements AuthService {
    private AdminService adminService;
    private PasswordEncoder encoder;
    private TokenRepository tokenRepository;

    @Autowired
    public AuthServiceImpl(AdminService adminService, PasswordEncoder encoder, TokenRepository tokenRepository) {
        this.adminService = adminService;
        this.encoder = encoder;
        this.tokenRepository = tokenRepository;
    }

    @Override
    public Map<String, String> login(LoginDto loginDto) {
        try {
            Admin persistentAdmin = adminService.getByEmail(loginDto.getUsername());
            if (encoder.matches(loginDto.getPassword(), persistentAdmin.getPassword())) {
                return handleToken(persistentAdmin);
            }
            throw new IllegalArgumentException("Password is incorrect!");
        }catch (RuntimeException e){
            log.error("Bad credentials for user <{}>. {}", loginDto.getUsername(), e.getLocalizedMessage());
            throw new BadAdminCredentialsException("Credentials aren't correct");
        }
    }

    @Override
    public void logout() {
        Admin persistentAdmin = (Admin) SecurityContextHolder.getContext().getAuthentication().getDetails();
        tokenRepository.deleteTokenByAdmin(persistentAdmin);
    }

    private Map<String, String> handleToken(Admin admin){
        //delete current token if present
        tokenRepository.deleteTokenByAdmin(admin);

        //generate new token
        Token token = Token.builder()
            .token(UUID.randomUUID().toString())
            .admin(admin)
            .build();
        tokenRepository.save(token).getToken();

        //prepare json to return
        Map<String, String> tokenJson = new HashMap<>();
        tokenJson.put("token", token.getToken());
        return tokenJson;
    }
}
