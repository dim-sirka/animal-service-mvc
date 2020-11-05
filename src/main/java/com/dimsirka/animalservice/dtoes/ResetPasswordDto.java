package com.dimsirka.animalservice.dtoes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ResetPasswordDto {
    @NotEmpty(message = "Old password should be specified")
    private String oldPassword;
    @NotEmpty(message = "New password should be specified")
    @Size(min = 8, message = "Password must be at least 8 symbols long")
    @Pattern(regexp = ".*[A-Za-z]+.*", message = "Pattern has to contain at least 1 alphabetical character")
    @Pattern(regexp = ".*[0-9]+.*", message = "Pattern has to contain at least 1 numeric character")
    private String newPassword;
}
