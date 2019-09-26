package pl.kornelkarcz.event.donate;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;
import pl.kornelkarcz.model.User;

import java.util.Locale;

@Getter
@Setter
public class OnDonationEvent extends ApplicationEvent {

    private Locale locale;
    private User user;

    public OnDonationEvent(User user, Locale locale) {
        super(user);
        this.user = user;
        this.locale = locale;
    }
}
