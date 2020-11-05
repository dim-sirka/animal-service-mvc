package com.dimsirka.animalservice.mapper;

import java.util.List;
import java.util.stream.Collectors;

public interface EntityDtoMapper<E, D> {
    D toDto(E entity);

    E toEntity(D entity);

    default List<D> toDtoList (List<E> entities){
        return entities.stream().map(this::toDto).collect(Collectors.toList());
    }
}
