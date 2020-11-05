package com.dimsirka.animalservice.exceptions;

public class AdminNotFoundException extends EntityNotFoundException{
    public AdminNotFoundException(String message) {
        super(message);
    }
}
