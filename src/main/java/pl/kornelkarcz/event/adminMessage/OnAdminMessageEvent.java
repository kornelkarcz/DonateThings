package pl.kornelkarcz.event.adminMessage;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;

import java.util.Locale;

@Getter
@Setter
public class OnAdminMessageEvent extends ApplicationEvent {

    private Locale locale;
    private String name;
    private String message;

    public OnAdminMessageEvent(String name, String message, Locale locale) {
        super(name);
        this.name = name;
        this.message = message;
        this.locale = locale;
    }
}