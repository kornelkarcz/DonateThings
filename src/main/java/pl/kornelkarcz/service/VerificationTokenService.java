package pl.kornelkarcz.service;

import lombok.Data;
import org.springframework.stereotype.Service;
import pl.kornelkarcz.repository.VerificationTokenRepository;

@Service
@Data
public class VerificationTokenService {

    private final VerificationTokenRepository verificationTokenRepository;

    public void deleteUserTokens(Long id) {
        verificationTokenRepository.deleteVerificationTokenByUserId(id);
    }
}
