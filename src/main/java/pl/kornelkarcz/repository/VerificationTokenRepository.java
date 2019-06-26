package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;

public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {

    VerificationToken findByToken(String token);

    VerificationToken findByUser(User user);
}
