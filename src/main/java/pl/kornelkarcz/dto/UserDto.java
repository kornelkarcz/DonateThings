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
    @NotEmpty
    private String firstName;

    @NotNull
    @NotEmpty(message = "Last name cannot be empty UserDto")
    private String lastName;

    @ValidEmail
    @NotNull
    @NotEmpty
    private String email;

    @NotNull
    @NotEmpty
    @ValidPassword
    private String password;
    private String matchingPassword;
    private Boolean enabled;


}
