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
        email.setText("Dear " + user.getFirstName()
                        + ",\n\nThank you for making donation. We are very happy you have decided to support people who need help.\n\n"
                        + "Please be advised that you will be contacted by our courier to arrange collection of your donation."
                        + "\n\n"
                        + "Kind regards,\nDonateThings Team");
        mailSender.send(email);
    }

}
