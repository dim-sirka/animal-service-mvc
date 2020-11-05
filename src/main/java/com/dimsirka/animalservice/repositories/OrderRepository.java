package com.dimsirka.animalservice.repositories;

import com.dimsirka.animalservice.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
