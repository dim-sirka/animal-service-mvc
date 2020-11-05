package com.dimsirka.animalservice.services.impl;

import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.entities.Order;
import com.dimsirka.animalservice.entities.OrderStatus;
import com.dimsirka.animalservice.exceptions.AnimalNotFoundException;
import com.dimsirka.animalservice.exceptions.OrderNotFoundException;
import com.dimsirka.animalservice.repositories.OrderRepository;
import com.dimsirka.animalservice.services.AnimalService;
import com.dimsirka.animalservice.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    private OrderRepository orderRepository;
    private AnimalService animalService;

    @Autowired
    public OrderServiceImpl(OrderRepository orderRepository,
                            AnimalService animalService) {
        this.orderRepository = orderRepository;
        this.animalService = animalService;
    }

    @Override
    public Order create(Order order) {
        Animal persistentAnimal = animalService.getById(order.getAnimal().getId());
        if (persistentAnimal.getAnimalStatus().equals(AnimalStatus.FREE)){
            //update status for a chosen animal
            persistentAnimal.setAnimalStatus(AnimalStatus.BOOKED);
            //set order status
            order.setAnimal(persistentAnimal);
            order.setOrderStatus(OrderStatus.PENDING);
            return orderRepository.save(order);
        }else {
            throw new AnimalNotFoundException("Animal with a specified id isn't available!");
        }
    }

    @Override
    public Order update(Order order) {
        Order persistentOrder = getByIdOrThrowException(order.getId());
        persistentOrder.setUserName(order.getUserName());
        return orderRepository.save(persistentOrder);
    }

    @Override
    public Order getById(Long id) {
        return getByIdOrThrowException(id);
    }

    @Override
    public List<Order> getAll() {
        return orderRepository.findAll();
    }

    @Override
    public void cancelOrConfirm(Long id, OrderStatus orderStatus) {
        Order persistentOrder = getByIdOrThrowException(id);
        persistentOrder.setOrderStatus(orderStatus);
        orderRepository.save(persistentOrder);

        //update animalStatus according to an order status
        AnimalStatus animalStatus = AnimalStatus.ARCHIVE;
        if(orderStatus.equals(OrderStatus.CANCELED)){
           animalStatus = AnimalStatus.FREE;
        }
        animalService.updateStatus(persistentOrder.getAnimal().getId(), animalStatus);
    }

    private Order getByIdOrThrowException(Long id){
        return orderRepository.findById(id).
                orElseThrow(()-> new OrderNotFoundException("Order with a specified id isn't found!"));
    }
}

