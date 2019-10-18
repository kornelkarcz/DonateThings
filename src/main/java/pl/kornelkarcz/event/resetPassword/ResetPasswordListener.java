package pl.kornelkarcz.event.resetPassword;

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

import java.util.UUID;

@Component
@Getter
@Setter
@RequiredArgsConstructor
public class ResetPasswordListener implements ApplicationListener<OnResetPassword> {

    private final UserService userService;
    private final MailSender mailSender;
    private final MessageSource messages;

    @Override
    public void onApplicationEvent(OnResetPassword event) {
        this.resetPassword(event);
    }

    private void resetPassword(OnResetPassword event) {
        User user = event.getUser();
        String token = UUID.randomUUID().toString();
        userService.createResetPasswordToken(user, token);

        String recipientAddress = user.getEmail();
        String subject = "Reset Password";
        String resetPasswordUrl = event.getAppUrl() + "/confirm-reset?token=" + token;
        String message = messages.getMessage("message.resetPass", null, event.getLocale());

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText("Dear " + user.getFirstName()
                + ",\n\nThank you for being with us. Please find below reset password link.\n\n"
                + "http://localhost:8080"
                + resetPasswordUrl + "\n\n"
                + "Kind regards,\nDonateThings Team");
        mailSender.send(email);

    }
}
