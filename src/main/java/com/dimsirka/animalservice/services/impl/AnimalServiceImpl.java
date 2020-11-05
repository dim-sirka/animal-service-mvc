package com.dimsirka.animalservice.services.impl;

import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.exceptions.AnimalNotFoundException;
import com.dimsirka.animalservice.exceptions.EntityDuplicateException;
import com.dimsirka.animalservice.repositories.AnimalRepository;
import com.dimsirka.animalservice.services.AnimalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnimalServiceImpl implements AnimalService{
    private AnimalRepository animalRepository;

    @Autowired
    public AnimalServiceImpl(AnimalRepository animalRepository) {
        this.animalRepository = animalRepository;
    }

    @Override
    public Animal create(Animal animal) {
        try{
            return animalRepository.save(animal);
        }catch (DataIntegrityViolationException e){
            throw new EntityDuplicateException("Animal with a specified name exists!");
        }
    }

    @Override
    public Animal update(Animal animal) {
        try{
            Animal persistentAnimal = getByIdOrThrowException(animal.getId());
            persistentAnimal.setName(animal.getName());
            persistentAnimal.setAnimalStatus(animal.getAnimalStatus());
            persistentAnimal.setAnimalType(animal.getAnimalType());
            persistentAnimal.setDescription(animal.getDescription());
            return animalRepository.save(persistentAnimal);
        }catch (DataIntegrityViolationException e){
            throw new EntityDuplicateException("Animal with a specified name exists!");
        }
    }

    @Override
    public void updateStatus(Long id, AnimalStatus animalStatus) {
        Animal persistentAnimal = getByIdOrThrowException(id);
        persistentAnimal.setAnimalStatus(animalStatus);
        animalRepository.save(persistentAnimal);
    }

    @Override
    public Animal getById(Long id) {
        return getByIdOrThrowException(id);
    }

    @Override
    public List<Animal> getAll() {
        return animalRepository.findAll();
    }

    @Override
    public List<Animal> getAllByAnimalStatus(AnimalStatus animalStatus) {
        return animalRepository.findAllByAnimalStatus(animalStatus);
    }

    private Animal getByIdOrThrowException(Long id){
        return animalRepository.findById(id).
                orElseThrow(()-> new AnimalNotFoundException("Animal with a specified id isn't found!"));
    }
}
