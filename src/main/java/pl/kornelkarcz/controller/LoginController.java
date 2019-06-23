package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.config.CurrentUser;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.UserService;

import javax.validation.Valid;


@Controller
@RequiredArgsConstructor
@SessionAttributes({"loggedUser"})
public class LoginController {

    private final UserService userService;

    @GetMapping("/login")
    public String getLoginPage() {
        return "login";
    }

    @GetMapping("/loginSuccess")
    public String loginSuccess(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User loggedUser = currentUser.getUser();
        model.addAttribute("loggedUser", loggedUser);
        Long id = loggedUser.getId();
        String successLogin = "Hello, " + id + ", you have successfully logged in";
        model.addAttribute("logSuccessMessage", successLogin);
        return "loginSuccess";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        User userExists = userService.findUserByEmail(user.getEmail());
        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user", "There is already a user registered with the email provided");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("register");
        } else {
            userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully.");
            modelAndView.addObject("user", new User());
            modelAndView.setViewName("index");
        }
        return modelAndView;
    }

}
