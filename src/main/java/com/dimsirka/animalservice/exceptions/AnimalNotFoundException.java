package com.dimsirka.animalservice.exceptions;

public class AnimalNotFoundException extends EntityNotFoundException{

    public AnimalNotFoundException(String message) {
        super(message);
    }
}
