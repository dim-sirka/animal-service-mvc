package com.dimsirka.animalservice.services;
import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.entities.Order;
import com.dimsirka.animalservice.entities.OrderStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderService {
    Order create (Order order);

    Order update (Order order);

    Order getById(Long id);

    List<Order> getAll();

    void cancelOrConfirm(Long id, OrderStatus orderStatus);

    Page<Order> getAllByOrderStatus(int pageNumber, OrderStatus orderStatus);

    Page<Order> findAllByName(int pageNumber, String nameQuery);

    Page<Order> getByConfirmedAndCanceledStatus(int pageNumber, List<OrderStatus> orderStatuses);

}
