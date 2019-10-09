package pl.kornelkarcz.event.collect;

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

import java.util.List;

@Component
@Getter
@Setter
@RequiredArgsConstructor
public class CollectionListener implements ApplicationListener<OnCollectionEvent> {

    private final UserService userService;
    private final MailSender mailSender;
    private final MessageSource messages;

    @Override
    public void onApplicationEvent(OnCollectionEvent event) {
        this.confirmCollection(event);
    }

    private void confirmCollection(OnCollectionEvent event) {
        User user = event.getUser();
        List<String> usersEmail = event.getUsersEmails();

        String recipient = user.getEmail();
        String subject = "Collection Confirmation";
        String message = messages.getMessage("message.regSucc", null, event.getLocale());

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipient);
        email.setSubject(subject);
        email.setText("Thank you for your collection.");
        mailSender.send(email);

        String notificationSubject = "New Collection Organized";
        String notificationText = "Dear User, please be informed that new collection is being organized";

        for (String tempEmail : usersEmail){
            SimpleMailMessage notification = new SimpleMailMessage();

            if (tempEmail.equals(recipient)) {
                continue;
            }
            notification.setTo(tempEmail);
            notification.setSubject(notificationSubject);
            notification.setText(notificationText);

            mailSender.send(notification);
        }
    }
}
