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
@FieldMatch(first = "newPassword", second = "matchingPassword", message = "Passwords do not match")
public class ChangePasswordDto {

    @NotEmpty(message = "This field cannot be empty")
    private String oldPassword;

    @NotEmpty(message = "This field cannot be empty")
    @ValidPassword(message = "The password doesn't meet requirements")
    private String newPassword;

    @NotEmpty(message = "This field cannot be empty")
    @ValidPassword(message = "The password doesn't meet requirements")
    private String matchingPassword;

}
