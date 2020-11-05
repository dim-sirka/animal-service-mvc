package com.dimsirka.animalservice.integration;

import com.dimsirka.animalservice.AnimalServiceApplication;
import com.dimsirka.animalservice.dtoes.AnimalDto;
import com.dimsirka.animalservice.dtoes.LoginDto;
import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.entities.AnimalType;
import com.dimsirka.animalservice.mapper.AnimalDtoMapper;
import com.dimsirka.animalservice.repositories.AnimalRepository;
import org.junit.jupiter.api.AfterEach;
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
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(classes = AnimalServiceApplication.class,
        webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class AnimalControllerTest extends AbstractContainer
{
    @Autowired
    private TestRestTemplate template;
    @Autowired
    private AnimalRepository animalRepository;
    @Autowired
    private AnimalDtoMapper mapper;
    private HttpHeaders headers = new HttpHeaders();
    private HttpEntity<AnimalDto> request;
    private final String exceptionMessage = "Animal with a specified id isn't found!";

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

    @AfterEach
    void afterEach() {
        animalRepository.deleteAll();
    }

    @Test
    void createAnimalTest_successFlow() {
        final String url = "/api/animals";
        AnimalDto requestDto = getAnimalDtoFixture();
        request = new HttpEntity<>(requestDto, headers);

        //Make call
        ResponseEntity<AnimalDto> response =
                this.template.exchange(url, HttpMethod.POST, request, AnimalDto.class);

        //Verify request succeed
        assertEquals(201, response.getStatusCodeValue());
        assertThat(requestDto).isEqualToIgnoringGivenFields(response.getBody(), "id", "createdDate", "updatedDate");
    }

    @Test
    void createDuplicateAnimalTest_unSuccessFlow() {
        final String url = "/api/animals";
        AnimalDto requestDto = getAnimalDtoFixture();
        animalRepository.save(mapper.toEntity(requestDto));

        //Make call
        request = new HttpEntity<>(requestDto, headers);
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.POST, request,
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify AnimalNotFoundException exception
        assertEquals(400, response.getStatusCodeValue());
        assertEquals("Animal with a specified name exists!", response.getBody().get("error"));
    }

    @Test
    void createContentTestWithMissedRequiredField_unSuccessFlow() {
        final String url = "/api/animals";
        //Make field name empty
        AnimalDto requestDto = getAnimalDtoFixture();
        requestDto.setName(" ");
        request = new HttpEntity<>(requestDto, headers);

        //Make call
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.POST, request, new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify this exception because of validation missed field
        assertEquals(400, response.getStatusCodeValue());
        assertEquals("Animal name should be specified", response.getBody().get("name"));
    }

    @Test
    void updateAnimalTest_successFlow() {
        AnimalDto requestDto = getAnimalDtoFixture();
        Long animalId = animalRepository.save(mapper.toEntity(requestDto)).getId();


        //Make call
        requestDto.setName("Drago-updated");
        final String url = "/api/animals/" + animalId;
        request = new HttpEntity<>(requestDto, headers);
        ResponseEntity<AnimalDto> response =
                this.template.exchange(url, HttpMethod.PUT, request, AnimalDto.class);

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertThat(requestDto).isEqualToIgnoringGivenFields(response.getBody(), "id", "createdDate", "updatedDate");
    }

    @Test
    void updateAnimalTest_unSuccessFlow() {
        AnimalDto requestDto = getAnimalDtoFixture();

        //Make call with fake animalId
        requestDto.setName("Drago-updated");
        final String url = "/api/animals/" + Integer.MAX_VALUE;
        request = new HttpEntity<>(requestDto, headers);
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                        url, HttpMethod.PUT, request,
                        new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify AnimalNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    @Test
    void getAnimalByIdTest_successFlow() {
        AnimalDto requestDto = getAnimalDtoFixture();
        Long animalId = animalRepository.save(mapper.toEntity(requestDto)).getId();

        //Make call
        final String url = "/api/animals/" + animalId;
        ResponseEntity<AnimalDto> response =
                this.template.exchange(url, HttpMethod.GET, null, AnimalDto.class);

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertThat(requestDto).isEqualToIgnoringGivenFields(response.getBody(),
                "id", "createdDate", "updatedDate");
    }

    @Test
    void getAnimalByIdTest_unSuccessFlow() {
        //Make call
        final String url = "/api/animals/" + Integer.MAX_VALUE;
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.GET, null,
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify AnimalNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    @Test
    void getAllByIdTest_successFlow() {
        Animal animal1 = mapper.toEntity(getAnimalDtoFixture());
        Animal animal2 = mapper.toEntity(getAnimalDtoFixture());
        animal2.setName("Drago-2");
        animalRepository.save(animal1);
        animalRepository.save(animal2);

        //Make call
        final String url = "/api/animals";
        ResponseEntity<List<AnimalDto>> response = this.template.exchange(
                url, HttpMethod.GET, null,
                new ParameterizedTypeReference<List<AnimalDto>>() {});

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertEquals(
                mapper.toDtoList(Arrays.asList(animal1, animal2)).toString(),
                response.getBody().toString()
        );
    }

    @Test
    void getAnimalsByStatusTest_successFlow() {
        Animal animal1 = Animal.builder()
                .animalStatus(AnimalStatus.FREE)
                .animalType(AnimalType.CAT)
                .name("Drago1")
                .description("Drago is a friendly and easy-going pet. It needs to find a real family!").build();

        Animal animal2 = Animal.builder()
                .animalStatus(AnimalStatus.FREE)
                .animalType(AnimalType.CAT)
                .name("Drago2")
                .description("Drago is a friendly and easy-going pet. It needs to find a real family!").build();
        animalRepository.save(animal1);
        animalRepository.save(animal2);

        //Make call
        final String url = "/api/animals";
        URI uri = UriComponentsBuilder.fromPath(url)
                .queryParam("animalStatus", "FREE")
                .build().encode().toUri();

        ResponseEntity<List<AnimalDto>> response = this.template.exchange(
                uri, HttpMethod.GET, null,
                new ParameterizedTypeReference<List<AnimalDto>>() {});

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertEquals(
                mapper.toDtoList(Arrays.asList(animal1, animal2)).toString(),
                response.getBody().toString()
        );
    }

    @Test
    void getAnimalsEmptyListByStatusTest_successFlow() {
            Animal animal1 = Animal.builder()
                    .animalStatus(AnimalStatus.FREE)
                    .animalType(AnimalType.CAT)
                    .name("Drago1")
                    .description("Drago is a friendly and easy-going pet. It needs to find a real family!").build();

            Animal animal2 = Animal.builder()
                    .animalStatus(AnimalStatus.FREE)
                    .animalType(AnimalType.CAT)
                    .name("Drago2")
                    .description("Drago is a friendly and easy-going pet. It needs to find a real family!").build();
            animalRepository.save(animal1);
            animalRepository.save(animal2);
            //Make call
            final String url = "/api/animals";
            URI uri = UriComponentsBuilder.fromPath(url)
                    .queryParam("animalStatus", "BOOKED")
                    .build().encode().toUri();

            ResponseEntity<List<AnimalDto>> response = this.template.exchange(
                    uri, HttpMethod.GET, null,
                    new ParameterizedTypeReference<List<AnimalDto>>() {
                    });

            //Verify request succeed
            assertEquals(200, response.getStatusCodeValue());

    }

    private AnimalDto getAnimalDtoFixture(){
        return AnimalDto.builder()
                .animalStatus(AnimalStatus.FREE)
                .animalType(AnimalType.CAT)
                .name("Drago-1")
                .description("Drago is a friendly and easy-going pet. It needs to find a real family!").build();
    }
}
