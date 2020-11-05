package com.dimsirka.animalservice.services;
import com.dimsirka.animalservice.entities.Order;
import com.dimsirka.animalservice.entities.OrderStatus;

import java.util.List;

public interface OrderService {
    Order create (Order order);

    Order update (Order order);

    Order getById(Long id);

    List<Order> getAll();

    void cancelOrConfirm(Long id, OrderStatus orderStatus);
}
