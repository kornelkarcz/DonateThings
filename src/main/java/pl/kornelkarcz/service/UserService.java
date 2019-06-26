package pl.kornelkarcz.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.model.Role;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.repository.RoleRepository;
import pl.kornelkarcz.repository.UserRepository;
import pl.kornelkarcz.validator.EmailExistsException;

import java.util.Arrays;
import java.util.HashSet;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

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
//
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
}
