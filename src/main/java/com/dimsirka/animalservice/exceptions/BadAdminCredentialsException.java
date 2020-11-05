package com.dimsirka.animalservice.exceptions;

public class BadAdminCredentialsException extends RuntimeException {
    public BadAdminCredentialsException(String message) {
        super(message);
    }
}
