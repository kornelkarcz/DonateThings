package pl.kornelkarcz.dto;

import lombok.Data;
import pl.kornelkarcz.validator.PasswordMatches;
import pl.kornelkarcz.validator.ValidPassword;

import javax.validation.constraints.NotEmpty;

@Data
@PasswordMatches
public class PasswordForgotDto {

    @ValidPassword
    @NotEmpty
    private String newPassword;
    private String matchingPassword;

}
