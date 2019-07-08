package pl.kornelkarcz.event.resetPassword;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;
import pl.kornelkarcz.model.User;

import java.util.Locale;

@Getter
@Setter
public class OnResetPassword extends ApplicationEvent {

    private static final long serialVersionUID = 1L;
    private String appUrl;
    private Locale locale;
    private User user;

    public OnResetPassword(User user, Locale locale, String appUrl) {
        super(user);

        this.user = user;
        this.locale = locale;
        this.appUrl = appUrl;
    }


}
