package pl.kornelkarcz.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.thymeleaf.context.WebContext;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.repository.UserRepository;
import pl.kornelkarcz.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {

        //TODO To mogę skasować albo zakomentować

        String userName = "";
        if (authentication.getPrincipal() instanceof Principal) {
            userName = ((Principal)authentication.getPrincipal()).getName();
        } else {
            userName = ((User)authentication.getPrincipal()).getFirstName();
        }
        logger.info("First name " + userName);
        session.setAttribute("loggedUser", userService.findUserByEmail(userName));
        System.out.println(userName);
    }
}
