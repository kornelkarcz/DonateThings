package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.kornelkarcz.config.CurrentUser;
import pl.kornelkarcz.service.UserService;

import javax.servlet.http.HttpSession;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final UserService userService;

    @GetMapping("/")
    public String showHomepage(Model model, @AuthenticationPrincipal Principal principal) {

        if (principal != null) {
            String username = principal.getName();
            model.addAttribute("firstName", userService.findUserByEmail(username).getFirstName());
        }

        String message = "Hello Anonymous User!";
        model.addAttribute("helloMessage", message);
        return "index";
    }

    @GetMapping("/userDetails")
    public String showDetails(Model model, Principal principal) {

        CurrentUser loggedUser = (CurrentUser) ((Authentication) principal).getPrincipal();
        String userInfo = loggedUser.toString();
        model.addAttribute("userInfo", userInfo);
        return "userDetails";
    }

    @GetMapping("/403")
    public String accessDenied(Model model, Principal principal) {

        if (principal != null) {
            CurrentUser loggedUser = (CurrentUser) ((Authentication) principal).getPrincipal();

            String userInfo = loggedUser.toString();

            model.addAttribute("userInfo", userInfo);

            String message = "Hi " + principal.getName()
                    + "<br> You do not have permission to access this page!";
            model.addAttribute("message", message);

        }

        return "403";
    }
}
