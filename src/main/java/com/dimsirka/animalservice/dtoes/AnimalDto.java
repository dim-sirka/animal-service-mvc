package com.dimsirka.animalservice.dtoes;

import com.dimsirka.animalservice.entities.AnimalStatus;
import com.dimsirka.animalservice.entities.AnimalType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AnimalDto {
    private Long id;
    @NotBlank(message = "Animal name should be specified")
    private String name;
    @NotNull(message = "Animal type should be specified")
    private AnimalType animalType;
    @NotBlank(message = "Description should be specified")
    private String description;
    @NotNull(message = "Animal status should be specified")
    private AnimalStatus animalStatus;
    private Timestamp createdDate;
    private Timestamp updatedDate;
}
