package com.dimsirka.animalservice.dtoes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AdminDto{
    private Long id;
    @NotBlank(message = "First name should be specified")
    private String firstName;
    @NotBlank(message = "Last name should be specified")
    private String lastName;
    @NotBlank(message = "Email should be specified")
    @Email
    private String email;
    @NotBlank(message = "Password should be specified")
    private String password;
    @NotBlank(message = "Bank account should be specified")
    private String bankAccount;
    private Timestamp createdDate;
    private Timestamp updatedDate;
}
