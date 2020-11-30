package com.dimsirka.animalservice.services;
import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.entities.Order;
import com.dimsirka.animalservice.entities.OrderStatus;
import org.springframework.data.domain.Page;

import java.util.List;

public interface OrderService {
    Order create (Order order);

    Order update (Order order);

    Order getById(Long id);

    List<Order> getAll();

    Page<Order> getAllByOrderStatus(int pageNumber, OrderStatus orderStatus);

    void cancelOrConfirm(Long id, OrderStatus orderStatus);
}
