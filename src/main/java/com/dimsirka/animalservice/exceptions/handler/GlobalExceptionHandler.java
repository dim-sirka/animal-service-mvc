package com.dimsirka.animalservice.exceptions.handler;

import com.dimsirka.animalservice.exceptions.BadAdminCredentialsException;
import com.dimsirka.animalservice.exceptions.EntityDuplicateException;
import com.dimsirka.animalservice.exceptions.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;


@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    private static final String ERROR = "error";

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Map<String, String>> handleValidationExceptions(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach(error-> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(errors);
    }

    @ExceptionHandler({EntityNotFoundException.class})
    public ResponseEntity<Map<String, String>> handleEntityNotFoundException(Exception e) {
        log.warn(e.getMessage(), e);
        Map<String, String> errors = new HashMap<>();
        errors.put(ERROR, e.getLocalizedMessage());
        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(errors);
    }

    @ExceptionHandler({EntityDuplicateException.class, IllegalArgumentException.class})
    public ResponseEntity<Map<String, String>> handleEntityDuplicateException(Exception e) {
        log.warn(e.getMessage(), e);
        Map<String, String> errors = new HashMap<>();
        errors.put(ERROR, e.getLocalizedMessage());
        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(errors);
    }

    @ExceptionHandler({BadAdminCredentialsException.class})
    public ResponseEntity<Map<String, String>> handleBadAdminCredentialsException(Exception e) {
        log.warn(e.getLocalizedMessage());
        Map<String, String> errors = new HashMap<>();
        errors.put(ERROR, e.getLocalizedMessage());
        return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(errors);
    }
}
