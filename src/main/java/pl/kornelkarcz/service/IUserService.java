package pl.kornelkarcz.service;

import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.model.PasswordResetToken;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;
import pl.kornelkarcz.validator.EmailExistsException;

import java.util.List;

public interface IUserService {

    User registerNewUserAccount(UserDto userDto) throws EmailExistsException;

    User getUser(String verificationToken);

    void saveRegisteredUser(User user);

    void createVerificationToken(User user, String token);

    VerificationToken getVerificationToken(String verificationToken);

    void createResetPasswordToken(User user, String token);

    PasswordResetToken getPasswordResetToken(String passwordResetToken);

    void updatePassword(String password, Long id);

    void updatePersonalDetails(String firstName, String lastName, Long id);

    List<String> getUsersEmails();

    void deleteUserById(Long id);
}
