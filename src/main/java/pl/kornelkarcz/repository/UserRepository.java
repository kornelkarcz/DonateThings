package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kornelkarcz.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByEmail(String email);

}
