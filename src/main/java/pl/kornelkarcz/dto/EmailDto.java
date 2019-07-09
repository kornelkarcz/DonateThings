package pl.kornelkarcz.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import pl.kornelkarcz.validator.ValidEmail;

import javax.validation.constraints.NotEmpty;

@Data
@RequiredArgsConstructor
@ToString
public class EmailDto {

    @NotEmpty
    @ValidEmail
    private String email;
}
