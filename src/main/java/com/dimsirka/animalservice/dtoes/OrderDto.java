package com.dimsirka.animalservice.dtoes;
import com.dimsirka.animalservice.entities.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class OrderDto {
    private Long id;
    @NotBlank(message = "User email should be specified")
    @Email
    private String userEmail;
    @NotBlank(message = "User number should be specified")
    private String userPhoneNumber;
    @NotBlank(message = "User name should be specified")
    private String userName;
    private OrderStatus orderStatus;
    private Timestamp createdDate;
    private Timestamp updatedDate;
    @NotNull(message = "Animal id should be specified")
    private Long animalId;

}
