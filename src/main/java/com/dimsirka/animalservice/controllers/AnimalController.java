package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.AnimalDto;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.exceptions.EntityDuplicateException;
import com.dimsirka.animalservice.mapper.AnimalDtoMapper;
import com.dimsirka.animalservice.services.AnimalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
public class AnimalController {
    private AnimalService animalService;
    private AnimalDtoMapper mapper;

    @Autowired
    public AnimalController(AnimalService animalService, AnimalDtoMapper mapper) {
        this.animalService = animalService;
        this.mapper = mapper;
    }

    @PostMapping("/api/animals")
    @ResponseStatus(HttpStatus.CREATED)
    public AnimalDto create(@Validated @RequestBody AnimalDto animalDto){
        try {
            return mapper.toDto(animalService.create(mapper.toEntity(animalDto)));
        }catch (DataIntegrityViolationException e){
            throw new EntityDuplicateException("Animal with a specified name exists!");
        }
    }

    @PostMapping("/api/animals/{animalId}")
    @ResponseStatus(HttpStatus.OK)
    public AnimalDto update(@Validated @RequestBody AnimalDto animalDto, @PathVariable Long animalId){
        animalDto.setId(animalId);
        return mapper.toDto(animalService.update(mapper.toEntity(animalDto)));
    }

    @GetMapping("/api/animals/{animalId}")
    public String getById(@PathVariable Long animalId, Model model){
        AnimalDto animalDto =  mapper.toDto(animalService.getById(animalId));
        model.addAttribute("animal", animalDto);
        return "animal/info";
    }

    @GetMapping({"/home", "/"})
    public String getAll(ModelMap model){
        model.addAttribute("animals", mapper.toDtoList(animalService.getAllByAnimalStatus(AnimalStatus.FREE)));
        return "animal/list";
    }

    @GetMapping("/api/animals")
    @ResponseStatus(HttpStatus.OK)
    public String getByAnimalStatus(@RequestParam AnimalStatus animalStatus, ModelMap model){
        model.addAttribute("animals", mapper.toDtoList(animalService.getAllByAnimalStatus(animalStatus)));
        return "animal/list";
    }
}
