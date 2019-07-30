package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.UserService;

import java.security.Principal;

@Controller
@RequestMapping("/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserService userService;
    private final ApplicationEventPublisher eventPublisher;

    @GetMapping("/")
    public ModelAndView showProfilePage(@AuthenticationPrincipal Principal principal) {
        ModelAndView modelAndView = new ModelAndView();

        User loggedUser = userService.findUserByEmail(principal.getName());
        boolean isEnabled = loggedUser.getEnabled();
        System.out.println(isEnabled);

        if (isEnabled) {
            modelAndView.addObject("firstName", loggedUser.getFirstName());
            modelAndView.setViewName("profilePage");
        } else {
            return new ModelAndView("redirect:/resend-token");
        }

        return modelAndView;
    }
}
