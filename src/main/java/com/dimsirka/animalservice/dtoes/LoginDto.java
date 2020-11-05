package com.dimsirka.animalservice.dtoes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class LoginDto {
    @NotBlank(message = "Animal username should be specified")
    private String username;
    @NotBlank(message = "Animal password should be specified")
    private String password;
}
