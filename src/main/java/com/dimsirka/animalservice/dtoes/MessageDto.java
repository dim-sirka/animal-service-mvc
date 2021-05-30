package com.dimsirka.animalservice.dtoes;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class MessageDto {

    @NotBlank(message = "User name should be specified")
    private String userName;
    @NotBlank(message = "User email should be specified")
    @Email
    private String userEmail;
    @NotBlank(message = "User number should be specified")
    private String topic;
    @NotBlank(message = "User number should be specified")
    private String description;
}
