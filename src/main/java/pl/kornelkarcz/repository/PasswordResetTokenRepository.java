package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kornelkarcz.model.PasswordResetToken;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {

    PasswordResetToken findByToken(String token);
}
