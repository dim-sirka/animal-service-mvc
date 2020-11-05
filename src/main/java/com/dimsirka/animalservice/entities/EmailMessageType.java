package com.dimsirka.animalservice.entities;

public enum EmailMessageType {
    USER_MESSAGE("<DIM-SIRKA> YOUR ORDER IS PENDING", "Wait the call from manager!"),
    ADMIN_MESSAGE("<DIM-SIRKA> NEW ORDER IS PENDING", "Pay attention! You have one more order!");

    private final String subject;
    private final String message;

    EmailMessageType(String subject, String message) {
        this.subject = subject;
        this.message = message;
    }

    public String getSubject() {
        return subject;
    }

    public String getMessage() {
        return message;
    }
}
