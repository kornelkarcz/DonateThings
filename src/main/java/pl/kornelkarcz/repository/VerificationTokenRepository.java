package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;

public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {

    VerificationToken findByToken(String token);

    VerificationToken findByUser(User user);

    @Modifying
    @Query(value = "delete from verification_token where user_id = ?1",
    nativeQuery = true)
    void deleteVerificationTokenByUserId(Long id);
}
