package com.dimsirka.animalservice.repositories;

import com.dimsirka.animalservice.entities.Order;
import com.dimsirka.animalservice.entities.OrderStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    Page<Order> findAllByOrderStatus(OrderStatus orderStatus, Pageable pageable);

    Page<Order> findAllByAnimalName(String nameQuery, Pageable pageable);

    Page<Order> findAllByOrderStatusIn(List<OrderStatus> orderStatuses, Pageable pageable);
}
