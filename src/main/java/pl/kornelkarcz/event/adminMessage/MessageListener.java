package pl.kornelkarcz.event.adminMessage;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
@RequiredArgsConstructor
public class MessageListener implements ApplicationListener<OnAdminMessageEvent> {

    private final MailSender mailSender;
    private final MessageSource messages;

    public void onApplicationEvent(OnAdminMessageEvent event) {
        this.sendMessageToAdmin(event);
    }

    private void sendMessageToAdmin(OnAdminMessageEvent event) {

        String message = event.getMessage();
        String subject = "Inquiry to Admin";

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo("kornel.karcz@gmail.com");
        email.setSubject(subject);
        email.setText(message);
        mailSender.send(email);

    }
}
