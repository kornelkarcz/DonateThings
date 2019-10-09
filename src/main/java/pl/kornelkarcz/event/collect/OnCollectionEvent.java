package pl.kornelkarcz.event.collect;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;
import pl.kornelkarcz.model.User;

import java.util.List;
import java.util.Locale;

@Getter
@Setter
public class OnCollectionEvent extends ApplicationEvent {

    private Locale locale;
    private User user;
    private List<String> usersEmails;

    public OnCollectionEvent(User user, List<String> usersEmails, Locale locale) {
        super(user);
        this.user = user;
        this.usersEmails = usersEmails;
        this.locale = locale;
    }
}
