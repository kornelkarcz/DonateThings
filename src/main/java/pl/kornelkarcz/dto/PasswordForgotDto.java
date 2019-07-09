package pl.kornelkarcz.dto;

import lombok.*;
import pl.kornelkarcz.validator.FieldMatch;
import pl.kornelkarcz.validator.ValidPassword;

import javax.validation.constraints.NotEmpty;

@Data
@RequiredArgsConstructor
@Getter
@Setter
@ToString
@FieldMatch(first = "newPassword", second = "matchingPassword", message = "The passwords don't match")
public class PasswordForgotDto {

    @ValidPassword
    @NotEmpty
    private String newPassword;

    @ValidPassword
    @NotEmpty
    private String matchingPassword;

}
