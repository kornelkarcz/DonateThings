package pl.kornelkarcz.event.resendToken;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;
import pl.kornelkarcz.model.User;

import java.util.Locale;

@Getter
@Setter
public class OnResendTokenEvent extends ApplicationEvent {

    private static final long serialVersionUID = 1L;
    private String appUrl;
    private Locale locale;
    private User user;

    public OnResendTokenEvent(User user, Locale locale, String appUrl) {
        super(user);

        this.user = user;
        this.appUrl = appUrl;
        this.locale = locale;
    }
}
