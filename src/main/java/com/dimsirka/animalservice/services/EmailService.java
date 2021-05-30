package com.dimsirka.animalservice.services;

import com.dimsirka.animalservice.dtoes.MessageDto;
import com.dimsirka.animalservice.entities.EmailMessageType;

public interface EmailService {
    void sendMessage(String email, String extraMessage, EmailMessageType emailMessageType);
    void sendMessage(MessageDto messageDto, String adminEmail);
}
