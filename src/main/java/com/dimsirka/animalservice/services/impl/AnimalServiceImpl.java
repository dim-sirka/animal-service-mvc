package com.dimsirka.animalservice.services.impl;

import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.exceptions.AnimalNotFoundException;
import com.dimsirka.animalservice.exceptions.EntityDuplicateException;
import com.dimsirka.animalservice.exceptions.ServiceException;
import com.dimsirka.animalservice.repositories.AnimalRepository;
import com.dimsirka.animalservice.services.AnimalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnimalServiceImpl implements AnimalService{
    private AnimalRepository animalRepository;

    private static final int PAGE_SIZE = 3;

    private static final Sort SORT = Sort.by("updatedDate").descending();

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
    public Page<Animal> getAllByAnimalStatus(int pageNumber, AnimalStatus animalStatus) {
        Pageable pageable = createPageable(pageNumber);
        return animalRepository.findAllByAnimalStatus(animalStatus, pageable);
    }

    private Animal getByIdOrThrowException(Long id){
        return animalRepository.findById(id).
                orElseThrow(()-> new AnimalNotFoundException("Animal with a specified id isn't found!"));
    }

    private Pageable createPageable(int pageNumber) {

        if (pageNumber < 1) {
            throw new ServiceException("Incorrect page number!");
        }

        return PageRequest.of(pageNumber - 1, PAGE_SIZE, SORT);
    }
}
