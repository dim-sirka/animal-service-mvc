package com.dimsirka.animalservice.repositories;

import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnimalRepository extends JpaRepository<Animal, Long> {

    Page<Animal> findAllByAnimalStatus(AnimalStatus animalStatus, Pageable pageable);

}
