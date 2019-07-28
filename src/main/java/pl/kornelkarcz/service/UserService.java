package pl.kornelkarcz.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.model.PasswordResetToken;
import pl.kornelkarcz.model.Role;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;
import pl.kornelkarcz.repository.PasswordResetTokenRepository;
import pl.kornelkarcz.repository.RoleRepository;
import pl.kornelkarcz.repository.UserRepository;
import pl.kornelkarcz.repository.VerificationTokenRepository;
import pl.kornelkarcz.validator.EmailExistsException;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final VerificationTokenRepository tokenRepository;
    private final PasswordResetTokenRepository resetTokenRepository;

    public User findUserByEmail(String email) {
        return userRepository.findUserByEmail(email);
    }

    public User saveUser(UserDto userDto) throws EmailExistsException {


        if (emailExist(userDto.getEmail())) {
            throw new EmailExistsException("There is an account with that email address: " + userDto.getEmail());
        }
        User user = new User();

//        final User user = new User();
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setEmail(userDto.getEmail());
        user.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
        user.setEnabled(false);
//        user.setRoleSet(user.getRoleSet().add(roleRepository.getOne(1L)));
//        user.getRoleSet().add(roleRepository.getOne(1L));

        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoleSet(new HashSet<Role>(Arrays.asList(userRole)));
        return userRepository.save(user);
    }

    private boolean emailExist(String email) {
        User user = userRepository.findUserByEmail(email);
        if (user != null) {
            return true;
        }
        return false;
    }

    @Override
    public User registerNewUserAccount(UserDto userDto) throws EmailExistsException {
        if (emailExist(userDto.getEmail())) {
            throw new EmailExistsException("There is an account with that email address: " + userDto.getEmail());
        }

        User user = new User();
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setEmail(userDto.getEmail());
        user.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
        user.setEnabled(false);

        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoleSet(new HashSet<Role>(Arrays.asList(userRole)));
        return userRepository.save(user);

    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User getUser(String verificationToken) {
        User user = tokenRepository.findByToken(verificationToken).getUser();
        return user;
    }

    @Override
    public void saveRegisteredUser(User user) {
        userRepository.save(user);

    }

    @Override
    public void createVerificationToken(User user, String token) {
        VerificationToken myToken = new VerificationToken(token, user);
        tokenRepository.save(myToken);

    }

    @Override
    public VerificationToken getVerificationToken(String verificationToken) {
        return tokenRepository.findByToken(verificationToken);
    }

    @Override
    public void createResetPasswordToken(User user, String token) {
        PasswordResetToken myToken = new PasswordResetToken(token, user);
        resetTokenRepository.save(myToken);

    }

    @Override
    public PasswordResetToken getPasswordResetToken(String passwordResetToken) {
        return resetTokenRepository.findByToken(passwordResetToken);
    }

    @Override
    public void updatePassword(String password, Long id) {
        userRepository.updatePassword(password, id);
    }
}
