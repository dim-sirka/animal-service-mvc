package com.dimsirka.animalservice.controllers;

import com.dimsirka.animalservice.dtoes.AnimalDto;
import com.dimsirka.animalservice.dtoes.PageDto;
import com.dimsirka.animalservice.entities.Animal;
import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.exceptions.EntityDuplicateException;
import com.dimsirka.animalservice.mapper.AnimalDtoMapper;
import com.dimsirka.animalservice.services.AnimalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@Controller
public class AnimalController {
    private AnimalService animalService;
    private AnimalDtoMapper mapper;


    @Autowired
    public AnimalController(AnimalService animalService, AnimalDtoMapper mapper) {
        this.animalService = animalService;
        this.mapper = mapper;
    }

    @GetMapping("/animals/create")
    public String getCreateget(Model model){
        return "animal/formCreateAnimal";
    }

    @PostMapping("/animals/new")
    public String create(@ModelAttribute AnimalDto animalDto, Model model) {
        animalService.create(mapper.toEntity(animalDto));
        return "redirect:/home";
    }


    @GetMapping("/animals/editForm/{animalId}")
    public String getUpdateForm(@PathVariable Long animalId, Model model) {
        Animal animalUpdate = animalService.getById(animalId);
        model.addAttribute("animal", animalUpdate);
        return "animal/editAnimal";
    }

    @PostMapping("/animals/update")
    public String update(@ModelAttribute("Animal") Animal animal) {
        animalService.update(animal);
        return String.format("redirect:/animals/%s", animal.getId());
    }

    @GetMapping("/animals/{animalId}")
    public String getById(@PathVariable Long animalId, Model model) {
        AnimalDto animalDto = mapper.toDto(animalService.getById(animalId));
        model.addAttribute("animal", animalDto);
        return "animal/info";
    }

    @GetMapping({"/animals/type"})
    public String getAllAnimalType(@RequestParam AnimalType animalType,
                                   @RequestParam(name = "page", required = false, defaultValue = "1") int pageNumber,
                                   ModelMap model) {
        Page<Animal> animalsPage = animalService.getAllByAnimalStatusAndAnimalType(pageNumber, AnimalStatus.FREE, animalType);
        PageDto animals = this.mapper.toAnimalsPage(animalsPage);
        model.addAttribute("animals", animals);
        return "animal/list";
    }

    @GetMapping({"/home", "/"})
    public String getAll(@RequestParam(name = "page", required = false, defaultValue = "1") int pageNumber, ModelMap model) {
        Page<Animal> animalsPage = animalService.getAllByAnimalStatus(pageNumber, AnimalStatus.FREE);
        PageDto animals = this.mapper.toAnimalsPage(animalsPage);
        model.addAttribute("animals", animals);
        return "animal/list";
    }

    @GetMapping("/animals")
    @ResponseStatus(HttpStatus.OK)
    public String getByAnimalStatus(@RequestParam AnimalStatus animalStatus,
                                    @RequestParam(name = "page", required = false, defaultValue = "1") int pageNumber,
                                    ModelMap model) {
        Page<Animal> animalsPage = animalService.getAllByAnimalStatus(pageNumber, animalStatus);
        PageDto animals = this.mapper.toAnimalsPage(animalsPage);
        model.addAttribute("animals", animals);
        return "animal/list";
    }

    @GetMapping("/animals/")
    public String getByAnimalName( @RequestParam("name") String animalName, Model model) {
        AnimalDto animalDto = mapper.toDto(animalService.getByAnimalName(animalName));
        model.addAttribute("animal", animalDto);
        return "animal/info";
    }

}
