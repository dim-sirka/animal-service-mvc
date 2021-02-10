package com.dimsirka.animalservice.mapper;

import com.dimsirka.animalservice.dtoes.OrderDto;
import com.dimsirka.animalservice.dtoes.PageDto;
import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.Order;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class OrderDtoMapper {
    public OrderDto toDto(Order order){
        return OrderDto.builder()
                .id(order.getId())
                .createdDate(order.getCreatedDate())
                .updatedDate(order.getUpdatedDate())
                .userEmail(order.getUserEmail())
                .userPhoneNumber(order.getUserPhoneNumber())
                .userName(order.getUserName())
                .orderStatus(order.getOrderStatus())
                .animalId(order.getAnimal().getId())
                .build();
    }

    public Order toEntity (OrderDto order){
        return Order.builder()
                .id(order.getId())
                .userEmail(order.getUserEmail())
                .userPhoneNumber(order.getUserPhoneNumber())
                .userName(order.getUserName())
                .orderStatus(order.getOrderStatus())
                .animal(Animal.builder().id(order.getAnimalId()).build())
                .build();
    }

    public PageDto toOrdersPage(Page<Order> ordersPage) {
        return PageDto.builder()
                .content(
                        ordersPage.getContent().stream()
                                .collect(Collectors.toList())
                )
                .currentPageNumber(ordersPage.getNumber() + 1)
                .totalPageNumber(ordersPage.getTotalPages())
                .hasNextPage(ordersPage.hasNext())
                .hasPreviousPage(ordersPage.hasPrevious())
                .build();

    }

    public List<OrderDto> toDtoList(List<Order> orders){
        return orders.stream().map(this::toDto).collect(Collectors.toList());
    }
}





