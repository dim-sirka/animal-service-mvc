package com.dimsirka.animalservice.validation;

import org.springframework.stereotype.Component;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;
import java.util.stream.Collectors;

@Component
public class DataValidator  {

    private Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

    public <T> ValidationResult validate(T data) {

        Set<ConstraintViolation<T>> constraintViolations = validator.validate(data);

        if (constraintViolations.isEmpty()) {
            return ValidationResult.valid();
        }

        String errorMessage = constraintViolations.stream()
                .map(ConstraintViolation::getMessage)
                .collect(Collectors.joining("\n"));

        return ValidationResult.withError(errorMessage);
    }
}
