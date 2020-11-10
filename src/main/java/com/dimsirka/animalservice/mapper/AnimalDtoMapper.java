package com.dimsirka.animalservice.mapper;

import com.dimsirka.animalservice.dtoes.AnimalDto;
import com.dimsirka.animalservice.entities.Animal;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

import static java.util.Objects.isNull;

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
                .age(animal.getAge())
                .mediaLinks(toMediaSet(animal.getMediaLinks()))
                .animalType(animal.getAnimalType()).build();
    }

    public Animal toEntity(AnimalDto animal) {
        return Animal.builder()
                .id(animal.getId())
                .name(animal.getName())
                .animalStatus(animal.getAnimalStatus())
                .description(animal.getDescription())
                .age(animal.getAge())
                .mediaLinks(toMediaString(animal.getMediaLinks()))
                .animalType(animal.getAnimalType()).build();
    }

    private HashSet<String> toMediaSet(String mediaLinks){
        if (!isNull(mediaLinks)) {
            String[] arr = mediaLinks.split(":::");
            return new HashSet<>(Arrays.asList(arr));
        }
        return null;
    }

    private String toMediaString(Set<String> mediaLinks){
        return mediaLinks.stream().collect(Collectors.joining(":::"));
    }
}
