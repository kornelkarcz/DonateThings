package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.kornelkarcz.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

}
