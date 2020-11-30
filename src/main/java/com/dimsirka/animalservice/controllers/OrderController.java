package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.OrderDto;
import com.dimsirka.animalservice.dtoes.PageDto;
import com.dimsirka.animalservice.entities.*;
import com.dimsirka.animalservice.mapper.OrderDtoMapper;
import com.dimsirka.animalservice.services.EmailService;
import com.dimsirka.animalservice.services.OrderService;
import com.dimsirka.animalservice.validation.DataValidator;
import com.dimsirka.animalservice.validation.ValidationResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@PropertySource("classpath:application.yaml")
@Controller
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

    @PostMapping("/edit/{orderId}")
    public String update(@Validated @RequestBody OrderDto orderDto, @PathVariable Long orderId, Model model){
        ValidationResult validationResult = dataValidator.validate(orderDto);

        if (validationResult.isError()) {
            model.addAttribute("error", validationResult.getErrorMessage());
            model.addAttribute("product", orderDto);
            return "/create";
        }

        orderService.update(orderService.getById(orderId));
        return "animal/list";
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

    @GetMapping("/cancel/{orderId}")
    public String cancel(@PathVariable Long orderId, Model model) {
        orderService.cancelOrConfirm(orderId, OrderStatus.CANCELED);
        List<Order> listOrders = orderService.getAll();
        model.addAttribute("listOrders", listOrders);
        return "redirect:/list/orders";
    }

    @GetMapping("/confirm/{orderId}")
    public String confirm(@PathVariable Long orderId, Model model){
        orderService.cancelOrConfirm(orderId, OrderStatus.CONFIRMED);
        List<Order> listOrders = orderService.getAll();
        model.addAttribute("listOrders", listOrders);
        return "redirect:/list/orders";
    }

    @GetMapping("/list/orders")
    @ResponseStatus(HttpStatus.OK)
    public String getByOrderStatus(@RequestParam(name = "page", required = false, defaultValue = "1") int pageNumber,
                                   ModelMap model) {
        OrderStatus orderStatus = OrderStatus.PENDING;
        Page<Order> ordersPage = orderService.getAllByOrderStatus(pageNumber, orderStatus);
        PageDto orders = this.mapper.toOrdersPage(ordersPage);
        model.addAttribute("orders", orders);
        return "order/list_order";
    }

}
