package com.dimsirka.animalservice.services;

import com.dimsirka.animalservice.dtoes.LoginDto;

import java.util.Map;

public interface AuthService {

    Map<String, String> login(LoginDto loginDto);

    void logout();
}
