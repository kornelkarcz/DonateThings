package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.config.CurrentUser;
import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.UserService;
import pl.kornelkarcz.validator.EmailExistsException;

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
        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        return "register";
    }

    @PostMapping("/register")
    public ModelAndView createNewUser(@ModelAttribute("user") @Valid UserDto userDto, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();

        User registered = new User();
        if (!bindingResult.hasErrors()) {
            System.out.println(userDto.toString());
            registered = createUserAccount(userDto, bindingResult);
        }
        if (registered == null) {
            bindingResult.rejectValue("email", "message.regError");
        }
        if (bindingResult.hasErrors()) {
            return new ModelAndView("register", "user", userDto);
        } else {
            return new ModelAndView("index", "user", userDto);
        }
    }

    private User createUserAccount(UserDto accountDto, BindingResult bindingResult) {
        User registered = null;
        try {
            registered = userService.saveUser(accountDto);
        } catch (EmailExistsException e) {
            return null;
        }
        return registered;
    }

}
