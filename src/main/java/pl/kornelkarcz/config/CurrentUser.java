package pl.kornelkarcz.config;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User {

    private final pl.kornelkarcz.model.User user;
    public CurrentUser(String email, String password,
                       Collection<? extends GrantedAuthority> authorities, pl.kornelkarcz.model.User user) {
        super(email, password, authorities);
        this.user = user;
    }
    public pl.kornelkarcz.model.User getUser() {
        return user;
    }

}
