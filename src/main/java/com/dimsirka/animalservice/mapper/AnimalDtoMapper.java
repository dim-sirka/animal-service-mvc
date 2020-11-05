package com.dimsirka.animalservice.mapper;

import com.dimsirka.animalservice.dtoes.AnimalDto;
import com.dimsirka.animalservice.entities.Animal;
import org.springframework.stereotype.Component;

@Component
public class AnimalDtoMapper implements EntityDtoMapper<Animal, AnimalDto> {

    public AnimalDto toDto(Animal animal) {
        return AnimalDto.builder()
                .id(animal.getId())
                .name(animal.getName())
                .animalStatus(animal.getAnimalStatus())
                .createdDate(animal.getCreatedDate())
                .updatedDate(animal.getUpdatedDate())
                .description(animal.getDescription())
                .animalType(animal.getAnimalType()).build();
    }

    public Animal toEntity(AnimalDto animal) {
        return Animal.builder()
                .id(animal.getId())
                .name(animal.getName())
                .animalStatus(animal.getAnimalStatus())
                .description(animal.getDescription())
                .animalType(animal.getAnimalType()).build();
    }
}
