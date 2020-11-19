package com.dimsirka.animalservice.dtoes.animal;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AnimalsPage {

    private List<AnimalDto> content;

    private int currentPageNumber;

    private int totalPageNumber;

    private boolean hasNextPage;

    private boolean hasPreviousPage;

}
