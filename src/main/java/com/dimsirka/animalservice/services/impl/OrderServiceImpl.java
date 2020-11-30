package com.dimsirka.animalservice.services.impl;

import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.entities.Order;
import com.dimsirka.animalservice.entities.OrderStatus;
import com.dimsirka.animalservice.exceptions.AnimalNotFoundException;
import com.dimsirka.animalservice.exceptions.OrderNotFoundException;
import com.dimsirka.animalservice.exceptions.ServiceException;
import com.dimsirka.animalservice.repositories.OrderRepository;
import com.dimsirka.animalservice.services.AnimalService;
import com.dimsirka.animalservice.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    private OrderRepository orderRepository;
    private AnimalService animalService;

    private static final int PAGE_SIZE = 15;

    private static final Sort SORT = Sort.by("updatedDate").descending();

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
    public Page<Order> getAllByOrderStatus(int pageNumber, OrderStatus orderStatus) {
        Pageable pageable = createPageable(pageNumber);
        return orderRepository.findAllByOrderStatus(orderStatus, pageable);
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

    @Override
    public Page<Order> findAllByName(int pageNumber, String nameQuery){
       Pageable pageable = createPageable(pageNumber);
       return orderRepository.findAllByAnimalName(nameQuery, pageable);
    }

    @Override
    public Page<Order> getByConfirmedAndCanceledStatus(int pageNumber, List<OrderStatus> orderStatuses
    ){
        Pageable pageable = createPageable(pageNumber);
        return orderRepository.findAllByOrderStatusIn(orderStatuses, pageable);
    }


    private Order getByIdOrThrowException(Long id){
        return orderRepository.findById(id).
                orElseThrow(()-> new OrderNotFoundException("Order with a specified id isn't found!"));
    }

    private Pageable createPageable(int pageNumber) {

        if (pageNumber < 1) {
            throw new ServiceException("Incorrect page number!");
        }

        return PageRequest.of(pageNumber - 1, PAGE_SIZE, SORT);
    }
}

