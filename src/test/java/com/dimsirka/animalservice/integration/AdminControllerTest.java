package com.dimsirka.animalservice.integration;

import com.dimsirka.animalservice.AnimalServiceApplication;
import com.dimsirka.animalservice.dtoes.AdminDto;
import com.dimsirka.animalservice.dtoes.LoginDto;
import com.dimsirka.animalservice.dtoes.ResetPasswordDto;
import org.junit.jupiter.api.BeforeEach;
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

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(classes = AnimalServiceApplication.class,
        webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class AdminControllerTest extends AbstractContainer{
    @Autowired
    private TestRestTemplate template;
    private HttpHeaders headers = new HttpHeaders();
    private HttpEntity<AdminDto> request;
    private final String exceptionMessage = "Admin with a specified id isn't found!";

    @BeforeEach
    void loginAndAddAuthorizationHeader(){
        final String url = "/api/login";
        LoginDto loginDto = LoginDto.builder().username("test@gmail.com").password("Qwerty123").build();
        HttpEntity<LoginDto> request = new HttpEntity<>(loginDto);

        //Make call
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.POST, request,
                        new ParameterizedTypeReference<Map<String, String>>() {});

        //add token to header
        headers.add("Authorization", "Bearer " + response.getBody().get("token"));
    }

    @Test
    void updateAnimalTest_successFlow() {
        AdminDto requestDto = getAdminDtoFixture();
        requestDto.setFirstName("NewName");

        //Make call
        final String url = "/api/admins/1";
        request = new HttpEntity<>(requestDto, headers);
        ResponseEntity<AdminDto> response =
                this.template.exchange(url, HttpMethod.PUT, request, AdminDto.class);

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertThat(requestDto).isEqualToIgnoringGivenFields(response.getBody(),
                "id", "createdDate", "updatedDate", "password");
    }

    @Test
    void updateAnimalTest_unSuccessFlow() {
        AdminDto requestDto = getAdminDtoFixture();
        requestDto.setFirstName("NewName");

        //Make call with fake animalId
        final String url = "/api/admins/" + Integer.MAX_VALUE;
        request = new HttpEntity<>(requestDto, headers);
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.PUT, request,
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify AdminNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    @Test
    void getAnimalByIdTest_successFlow() {
        AdminDto requestDto = getAdminDtoFixture();
        //return value according to object upgrade

        //Make call
        final String url = "/api/admins/1";
        request = new HttpEntity<>(new AdminDto(), headers);
        ResponseEntity<AdminDto> response =
                this.template.exchange(url, HttpMethod.GET, request, AdminDto.class);

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertThat(requestDto).isEqualToIgnoringGivenFields(response.getBody(),
                "id", "createdDate", "updatedDate", "password", "firstName");
    }

    @Test
    void getAnimalByIdTest_unSuccessFlow() {
        //Make call
        final String url = "/api/admins/" + Integer.MAX_VALUE;
        request = new HttpEntity<>(new AdminDto(), headers);
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.GET, request,
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify AdminNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    @Test
    void resetPasswordTest_successFlow() {
        ResetPasswordDto resetPasswordDto =  ResetPasswordDto.builder()
                .oldPassword("Qwerty123").newPassword("Qwerty123").build();

        //Make call
        final String url = "/api/admins/reset-password";
        HttpEntity<ResetPasswordDto> request = new HttpEntity<>(resetPasswordDto, headers);
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.POST, request,
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
    }

    @Test
    void resetPasswordTest_unSuccessFlow() {
        ResetPasswordDto resetPasswordDto =  ResetPasswordDto.builder()
                .oldPassword("Wrong").newPassword("Qwerty123").build();

        //Make call
        final String url = "/api/admins/reset-password";
        HttpEntity<ResetPasswordDto> request = new HttpEntity<>(resetPasswordDto, headers);
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.POST, request,
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify IllegalArgumentException exception
        assertEquals(400, response.getStatusCodeValue());
        assertEquals("Incorrect an old password provided", response.getBody().get("error"));
    }

    private AdminDto getAdminDtoFixture(){
        return AdminDto.builder()
                .bankAccount("2345678934567143")
                .email("test@gmail.com")
                .firstName("TestName")
                .lastName("TestSurname")
                .password("Qwerty123").build();
    }

}
