package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.AnimalDto;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.exceptions.EntityDuplicateException;
import com.dimsirka.animalservice.mapper.AnimalDtoMapper;
import com.dimsirka.animalservice.services.AnimalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/animals")
public class AnimalController {
    private AnimalService animalService;
    private AnimalDtoMapper mapper;

    @Autowired
    public AnimalController(AnimalService animalService, AnimalDtoMapper mapper) {
        this.animalService = animalService;
        this.mapper = mapper;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public AnimalDto create(@Validated @RequestBody AnimalDto animalDto){
        try {
            return mapper.toDto(animalService.create(mapper.toEntity(animalDto)));
        }catch (DataIntegrityViolationException e){
            throw new EntityDuplicateException("Animal with a specified name exists!");
        }
    }

    @PutMapping("/{animalId}")
    @ResponseStatus(HttpStatus.OK)
    public AnimalDto update(@Validated @RequestBody AnimalDto animalDto, @PathVariable Long animalId){
        animalDto.setId(animalId);
        return mapper.toDto(animalService.update(mapper.toEntity(animalDto)));
    }

    @GetMapping("/{animalId}")
    @ResponseStatus(HttpStatus.OK)
    public AnimalDto getById(@PathVariable Long animalId){
        return mapper.toDto(animalService.getById(animalId));
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<AnimalDto> getAll(){
        return mapper.toDtoList(animalService.getAll());
    }

    @GetMapping("/")
    @ResponseStatus(HttpStatus.OK)
    public List<AnimalDto> getByIdAndAnimalStatus(@RequestParam AnimalStatus animalStatus){
        return mapper.toDtoList(animalService.getAllByAnimalStatus(animalStatus));
    }
}
