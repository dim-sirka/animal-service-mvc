package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.OrderDto;
import com.dimsirka.animalservice.entities.EmailMessageType;
import com.dimsirka.animalservice.entities.OrderStatus;
import com.dimsirka.animalservice.mapper.OrderDtoMapper;
import com.dimsirka.animalservice.services.EmailService;
import com.dimsirka.animalservice.services.OrderService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@PropertySource("classpath:application.yaml")
@RestController
@RequestMapping("api/orders")
public class OrderController {

    @Value("${mail.adminEmail}")
    private String adminEmail;
    private OrderService orderService;
    private OrderDtoMapper mapper;
    private EmailService emailService;

    public OrderController(OrderService orderService,
                           OrderDtoMapper mapper,
                           EmailService emailService) {
        this.orderService = orderService;
        this.mapper = mapper;
        this.emailService = emailService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public OrderDto create(@Validated @RequestBody OrderDto orderDto){
        OrderDto persistentOrder = mapper.toDto(orderService.create(mapper.toEntity(orderDto)));
        emailService.sendMessage(orderDto.getUserEmail(),"", EmailMessageType.USER_MESSAGE);
        emailService.sendMessage(adminEmail,"", EmailMessageType.ADMIN_MESSAGE);
        return persistentOrder;
    }

    @PutMapping("/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    public OrderDto update(@Validated @RequestBody OrderDto orderDto, @PathVariable Long orderId){
        orderDto.setId(orderId);
        return mapper.toDto(orderService.update(mapper.toEntity(orderDto)));
    }

    @GetMapping("/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    public OrderDto getById(@PathVariable Long orderId){
        return mapper.toDto(orderService.getById(orderId));
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<OrderDto> getAll(){
        return mapper.toDtoList(orderService.getAll());
    }

    @PutMapping("/cancel/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    public void cancel(@PathVariable Long orderId) {
        orderService.cancelOrConfirm(orderId, OrderStatus.CANCELED);
    }

    @PutMapping("/confirm/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    public void confirm(@PathVariable Long orderId){
        orderService.cancelOrConfirm(orderId, OrderStatus.CONFIRMED);
    }
}
