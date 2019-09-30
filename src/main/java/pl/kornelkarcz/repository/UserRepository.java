package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.kornelkarcz.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByEmail(String email);

    @Modifying
    @Query("update User u set u.password = :password where u.id = :id")
    void updatePassword(@Param("password") String password, @Param("id") Long id);

    @Modifying
    @Query(value = "update User u set u.firstName = :firstName, u.lastName = :lastName where u.id = :id")
    void updatePersonalDetails(@Param("firstName") String firstName, @Param("lastName") String lastName, @Param("id") Long id);
}
