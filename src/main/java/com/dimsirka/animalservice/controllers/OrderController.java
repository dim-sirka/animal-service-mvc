package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.OrderDto;
import com.dimsirka.animalservice.entities.EmailMessageType;
import com.dimsirka.animalservice.entities.OrderStatus;
import com.dimsirka.animalservice.mapper.OrderDtoMapper;
import com.dimsirka.animalservice.services.EmailService;
import com.dimsirka.animalservice.services.OrderService;
import com.dimsirka.animalservice.validation.DataValidator;
import com.dimsirka.animalservice.validation.ValidationResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@PropertySource("classpath:application.yaml")
@Controller
@RequestMapping("api/orders")
public class OrderController {

    @Value("${mail.adminEmail}")
    private String adminEmail;
    private OrderService orderService;
    private OrderDtoMapper mapper;
    private EmailService emailService;

    private DataValidator dataValidator;

    @Autowired
    public OrderController(OrderService orderService, OrderDtoMapper mapper, EmailService emailService, DataValidator dataValidator) {
        this.orderService = orderService;
        this.mapper = mapper;
        this.emailService = emailService;
        this.dataValidator = dataValidator;
    }

    public OrderController(OrderService orderService,
                           OrderDtoMapper mapper,
                           EmailService emailService) {
        this.orderService = orderService;
        this.mapper = mapper;
        this.emailService = emailService;
    }

    @GetMapping("/new/{id}")
    public String getCreateForm(@PathVariable String id, Model model){
        model.addAttribute("id", id);
        return "order/create";
    }

    @PostMapping("/new")
    public String create(@ModelAttribute OrderDto orderDto, Model model){

        ValidationResult validationResult = dataValidator.validate(orderDto);

        if (validationResult.isError()) {
            model.addAttribute("error", validationResult.getErrorMessage());
            model.addAttribute("order", orderDto);
            return "order/create";
        }

        orderService.create(mapper.toEntity(orderDto));
        emailService.sendMessage(orderDto.getUserEmail(),"", EmailMessageType.USER_MESSAGE);
        emailService.sendMessage(adminEmail,"", EmailMessageType.ADMIN_MESSAGE);
        model.addAttribute("success", true);
        return "order/create";
    }

    @PostMapping("/{orderId}")
    public String update(@Validated @RequestBody OrderDto orderDto, @PathVariable Long orderId, Model model){
        ValidationResult validationResult = dataValidator.validate(orderDto);

        if (validationResult.isError()) {
            model.addAttribute("error", validationResult.getErrorMessage());
            model.addAttribute("product", orderDto);
            return "/create";
        }

        orderService.update(orderService.getById(orderId));
        return "/list";
    }

    @GetMapping("/{orderId}")
    public OrderDto getById(@PathVariable Long orderId){
        return mapper.toDto(orderService.getById(orderId));
    }

    @GetMapping
    public String getAll(Model model){
        model.addAttribute("orders", mapper.toDtoList(orderService.getAll()));
        return "animal/list";
    }

    @PostMapping("/cancel/{orderId}")
    public void cancel(@PathVariable Long orderId) {
        orderService.cancelOrConfirm(orderId, OrderStatus.CANCELED);
    }

    @PostMapping("/confirm/{orderId}")
    public void confirm(@PathVariable Long orderId){
        orderService.cancelOrConfirm(orderId, OrderStatus.CONFIRMED);
    }
}
