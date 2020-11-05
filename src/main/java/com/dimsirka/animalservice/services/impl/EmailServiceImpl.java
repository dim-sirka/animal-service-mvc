package com.dimsirka.animalservice.services.impl;

import com.dimsirka.animalservice.entities.EmailMessageType;
import com.dimsirka.animalservice.services.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import javax.mail.AuthenticationFailedException;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service
@Slf4j
public class EmailServiceImpl implements EmailService {

    private JavaMailSender javaMailSender;

    @Autowired
    public EmailServiceImpl(@Qualifier("getMailSender") JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public void sendMessage(String email, String extraMessage, EmailMessageType emailMessageType) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            mimeMessage.setSubject(emailMessageType.getSubject());
            mimeMessage.setContent(emailMessageType.getMessage() + extraMessage, "text/plain");
            javaMailSender.send(mimeMessage);
        } catch (Exception e) {
            log.error("Sending message with subject<{}> to user: <{}> was failed!",
                    emailMessageType.getSubject(), email);
        }
    }
}
