package com.dimsirka.animalservice.services;

import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import org.springframework.data.domain.Page;

public interface AnimalService {
    Animal create(Animal animal);

    Animal update(Animal animal);

    void updateStatus(Long id, AnimalStatus animalStatus);

    Animal getById(Long id);

    Animal getByAnimalName(String animalName);

    Page<Animal> getAllByAnimalStatus(int pageNumber, AnimalStatus animalStatus);
}
