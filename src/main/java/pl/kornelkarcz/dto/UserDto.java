package pl.kornelkarcz.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import pl.kornelkarcz.validator.PasswordMatches;
import pl.kornelkarcz.validator.ValidEmail;
import pl.kornelkarcz.validator.ValidPassword;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@RequiredArgsConstructor
@ToString
@Getter
@Setter
@PasswordMatches
public class UserDto {

    @NotNull
    @NotEmpty(message = "First name cannot be empty")
    private String firstName;

    @NotNull
    @NotEmpty(message = "Last name cannot be empty")
    private String lastName;

    @ValidEmail(message = "Invalid email pattern")
    @NotNull
    @NotEmpty(message = "Email cannot be empty")
    private String email;

    @NotNull
    @NotEmpty(message = "Password cannot be empty")
    @ValidPassword(message = "Invalid password/Passwords do not matches")
    private String password;
    private String matchingPassword;
    private Boolean enabled;


}
