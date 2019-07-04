package pl.kornelkarcz.dto;

import lombok.Data;
import pl.kornelkarcz.validator.ValidEmail;

import javax.validation.constraints.NotEmpty;

@Data
public class PasswordForgotDto {

    @ValidEmail
    @NotEmpty
    private String email;
}
