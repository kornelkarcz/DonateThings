package pl.kornelkarcz.service;

import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;
import pl.kornelkarcz.validator.EmailExistsException;

public interface IUserService {

    User registerNewUserAccount(UserDto userDto) throws EmailExistsException;

    User getUser(String verificationToken);

    void saveRegisteredUser(User user);

    void createVerificationToken(User user, String token);

    VerificationToken getVerificationToken(String verificationToken);
}
