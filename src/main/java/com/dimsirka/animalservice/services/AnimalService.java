package com.dimsirka.animalservice.services;

import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;

import java.util.List;

public interface AnimalService {
    Animal create (Animal animal);

    Animal update (Animal animal);

    void updateStatus(Long id, AnimalStatus animalStatus);

    Animal getById(Long id);

    List<Animal> getAll();

    List <Animal> getAllByAnimalStatus(AnimalStatus animalStatus);
}
