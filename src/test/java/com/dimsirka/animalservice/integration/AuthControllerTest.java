package com.dimsirka.animalservice.integration;


import com.dimsirka.animalservice.AnimalServiceApplication;
import com.dimsirka.animalservice.dtoes.LoginDto;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(classes = AnimalServiceApplication.class,
        webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class AuthControllerTest extends AbstractContainer {
    @Autowired
    private TestRestTemplate template;

    @Test
    void login_successFlow(){
        final String url = "/api/login";
        LoginDto loginDto = LoginDto.builder().username("test@gmail.com").password("Qwerty123").build();
        HttpEntity<LoginDto> request = new HttpEntity<>(loginDto);

        //Make call
        ResponseEntity<String> response =
                this.template.exchange(url, HttpMethod.POST, request, String.class);

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertEquals(String.class, response.getBody().getClass());
    }
    @Test
    void login_unSuccessFlow(){
        final String url = "/api/login";
        LoginDto loginDto = LoginDto.builder().username("test@gmail.com").password("Wrong").build();
        HttpEntity<LoginDto> request = new HttpEntity<>(loginDto);

        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.POST, request,
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify exception
        assertEquals(401, response.getStatusCodeValue());
    }

    @Test
    void logout_successFlow(){
        HttpEntity<LoginDto> request = new HttpEntity<>(null, loginAndAddAuthorizationHeader());

        //Make call
        final String url = "/api/logout";
        ResponseEntity<String> response =
                this.template.exchange(url, HttpMethod.POST, request, String.class);

        //Verify request succeed
        assertEquals(204, response.getStatusCodeValue());
    }

    private HttpHeaders loginAndAddAuthorizationHeader(){
        HttpHeaders headers = new HttpHeaders();
        final String url = "/api/login";
        LoginDto loginDto = LoginDto.builder().username("test@gmail.com").password("Qwerty123").build();
        HttpEntity<LoginDto> request = new HttpEntity<>(loginDto);

        //Make call
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.POST, request,
                        new ParameterizedTypeReference<Map<String, String>>() {});

        //add token to header
        headers.add("Authorization", "Bearer " + response.getBody().get("token"));
        return headers;
    }
}
