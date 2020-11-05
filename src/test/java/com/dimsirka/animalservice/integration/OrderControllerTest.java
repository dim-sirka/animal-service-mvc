package com.dimsirka.animalservice.integration;

import com.dimsirka.animalservice.AnimalServiceApplication;
import com.dimsirka.animalservice.dtoes.LoginDto;
import com.dimsirka.animalservice.dtoes.OrderDto;
import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.entities.AnimalType;
import com.dimsirka.animalservice.entities.Order;
import com.dimsirka.animalservice.mapper.OrderDtoMapper;
import com.dimsirka.animalservice.repositories.AnimalRepository;
import com.dimsirka.animalservice.repositories.OrderRepository;
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

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(classes = AnimalServiceApplication.class,
        webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class OrderControllerTest extends AbstractContainer {
    @Autowired
    private TestRestTemplate template;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private AnimalRepository animalRepository;
    @Autowired
    private OrderDtoMapper mapper;
    private HttpHeaders headers = new HttpHeaders();
    private final String exceptionMessage = "Order with a specified id isn't found!";
    private Animal testAnimal;

    @BeforeEach
    void beforeEach() {
        //create animal for creating order with animalId
        testAnimal = Animal.builder()
                .animalStatus(AnimalStatus.FREE)
                .animalType(AnimalType.CAT)
                .name("Drago")
                .description("Drago is a friendly and easy-going pet. It needs to find a real family!").build();
        animalRepository.save(testAnimal);

    }

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
        orderRepository.deleteAll();
        animalRepository.deleteAll();
    }

    @Test
    void createOrderTest_successFlow() {
        final String url = "/api/orders";
        OrderDto requestDto = OrderDto.builder()
                .animalId(testAnimal.getId())
                .userEmail("user@gmail.com")
                .userPhoneNumber("+380967834106")
                .userName("NoName")
                .build();

        //Make call
        ResponseEntity<OrderDto> response =
                this.template.exchange(url, HttpMethod.POST,  new HttpEntity<>(requestDto, headers), OrderDto.class);

        //Verify request succeed
        assertEquals(201, response.getStatusCodeValue());
        assertThat(requestDto)
                .isEqualToIgnoringGivenFields(response.getBody(),
                        "id", "createdDate", "updatedDate", "orderStatus");
    }

    @Test
    void createOrderWithMissedFieldsTest_unSuccessFlow() {
        final String url = "/api/orders";
        OrderDto requestDto = OrderDto.builder()
                .animalId(testAnimal.getId())
                .userEmail("user@gmail.com")
                .userPhoneNumber("+380967834106")
                .userName("")
                .build();

        //Make call
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.POST, new HttpEntity<>(requestDto, headers), new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify this exception because of validation missed field
        assertEquals(400, response.getStatusCodeValue());
        assertEquals("User name should be specified", response.getBody().get("userName"));
    }

    @Test
    void updateOrderTest_successFlow() {
        OrderDto requestDto = getOrderDtoFixture();
        Long animalId = orderRepository.save(mapper.toEntity(requestDto)).getId();
        requestDto.setUserName("NewName");

        //Make call
        final String url = "/api/orders/" + animalId;
        ResponseEntity<OrderDto> response =
                this.template.exchange(url, HttpMethod.PUT, new HttpEntity<>(requestDto, headers), OrderDto.class);

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertThat(requestDto).isEqualToIgnoringGivenFields(response.getBody(), "id", "createdDate", "updatedDate");
    }

    @Test
    void updateOrderTest_unSuccessFlow() {
        OrderDto requestDto = getOrderDtoFixture();
        requestDto.setUserName("NewName");

        //Make call with fake animalId
        final String url = "/api/orders/" + Integer.MAX_VALUE;
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.PUT, new HttpEntity<>(requestDto, headers),
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify AnimalNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    @Test
    void getOrderByIdTest_successFlow() {
        OrderDto requestDto = getOrderDtoFixture();
        Long orderId = orderRepository.save(mapper.toEntity(requestDto)).getId();

        //Make call
        final String url = "/api/orders/" + orderId;
        ResponseEntity<OrderDto> response =
                this.template.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), OrderDto.class);

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertThat(requestDto).isEqualToIgnoringGivenFields(response.getBody(),
                "id", "createdDate", "updatedDate");
    }

    @Test
    void getAnimalByIdTest_unSuccessFlow() {
        //Make call
        final String url = "/api/orders/" + Integer.MAX_VALUE;
        ResponseEntity<Map<String, String>> response = this.template.exchange(
                url, HttpMethod.GET, new HttpEntity<>(headers),
                new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify AnimalNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    @Test
    void getAllByIdTest_successFlow() {
        Order order1 = mapper.toEntity(getOrderDtoFixture());
        orderRepository.save(order1);

        //Make call
        final String url = "/api/orders";
        ResponseEntity<List<OrderDto>> response = this.template.exchange(
                url, HttpMethod.GET, new HttpEntity<>(headers),
                new ParameterizedTypeReference<List<OrderDto>>() {});

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
        assertEquals(
                mapper.toDtoList(Arrays.asList(order1)).toString(),
                response.getBody().toString()
        );
    }

    @Test
    void cancelOrderByIdTest_successFlow() {
        //create order
        OrderDto requestDto = getOrderDtoFixture();
        Order persistentOrder = mapper.toEntity(requestDto);
        orderRepository.save(persistentOrder);

        //Make call
        final String url = "/api/orders/cancel/" + persistentOrder.getId();
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.PUT, new HttpEntity(null, headers), new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
    }

    @Test
    void cancelOrderByIdTest_unSuccessFlow() {
        //Make call
        final String url = "/api/orders/cancel/" + Integer.MAX_VALUE;
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.PUT, new HttpEntity(null, headers), new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify OrderNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    @Test
    void confirmOrderByIdTest_successFlow() {
        //create order
        OrderDto requestDto = getOrderDtoFixture();
        Order persistentOrder = mapper.toEntity(requestDto);
        orderRepository.save(persistentOrder);

        //Make call
        final String url = "/api/orders/confirm/" + persistentOrder.getId();
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.PUT, new HttpEntity(null, headers), new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify request succeed
        assertEquals(200, response.getStatusCodeValue());
    }

    @Test
    void confirmOrderByIdTest_unSuccessFlow() {
        //Make call
        final String url = "/api/orders/confirm/" + Integer.MAX_VALUE;
        ResponseEntity<Map<String, String>> response =
                this.template.exchange(url, HttpMethod.PUT, new HttpEntity(null, headers), new ParameterizedTypeReference<Map<String, String>>() {});

        //Verify OrderNotFoundException exception
        assertEquals(404, response.getStatusCodeValue());
        assertEquals(exceptionMessage, response.getBody().get("error"));
    }

    private OrderDto getOrderDtoFixture(){
        return OrderDto.builder()
                .animalId(testAnimal.getId())
                .userEmail("user@gmail.com")
                .userPhoneNumber("+380967834106")
                .userName("userName")
                .build();
    }
}