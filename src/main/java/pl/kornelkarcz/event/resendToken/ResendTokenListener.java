package pl.kornelkarcz.event.resendToken;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.UserService;
import pl.kornelkarcz.service.VerificationTokenService;

import java.util.UUID;

@Component
@Getter
@Setter
@RequiredArgsConstructor
public class ResendTokenListener implements ApplicationListener<OnResendTokenEvent> {

    private final UserService userService;
    private final VerificationTokenService verificationTokenService;
    private final MailSender mailSender;
    private final MessageSource messages;

    @Override
    public void onApplicationEvent(OnResendTokenEvent event) {
        this.activateAccount(event);
    }

    private void activateAccount(OnResendTokenEvent event) {
        User user = event.getUser();
        String token = UUID.randomUUID().toString();
        verificationTokenService.deleteUserTokens(user.getId());
        userService.createVerificationToken(user, token);

        String recipientAddress = user.getEmail();
        String subject = "New Verification Token";
        String confirmationUrl = event.getAppUrl() + "/activate-account?token=" + token;
        String message = messages.getMessage("message.regSucc", null, event.getLocale());

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText("Dear " + user.getFirstName()
                + ",\n\nThank you for registering at Donate Thing. We are very happy you have decided to join our community. Below you can find new verification link..\n\n"
                + "http://localhost:8080"
                + confirmationUrl + "\n\n"
                + "Kind regards,\nDonateThings Team");
        mailSender.send(email);

    }
}
