package pl.kornelkarcz.event.donate;

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

@Component
@Getter
@Setter
@RequiredArgsConstructor
public class DonationListener implements ApplicationListener<OnDonationEvent> {

    private final UserService userService;
    private final MailSender mailSender;
    private final MessageSource messages;

    @Override
    public void onApplicationEvent(OnDonationEvent event) {
        this.confirmDonation(event);
    }

    private void confirmDonation(OnDonationEvent event) {

        User user = event.getUser();

        String recipientAddress = user.getEmail();
        String subject = "Donation Confirmation";
        String message = messages.getMessage("message.regSucc", null, event.getLocale());

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText("Thank you for your donation. The currier will contact you to arrange reception of donation.\n" +
                "Please check your email.");
        mailSender.send(email);
    }

}
