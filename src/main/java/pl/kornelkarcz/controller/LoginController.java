package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.config.CurrentUser;
import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;
import pl.kornelkarcz.event.OnRegistrationCompleteEvent;
import pl.kornelkarcz.repository.UserRepository;
import pl.kornelkarcz.service.UserService;
import pl.kornelkarcz.validator.EmailExistsException;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Calendar;
import java.util.Locale;


@Controller
@RequiredArgsConstructor
@SessionAttributes({"loggedUser"})
public class LoginController {

    private final UserService userService;
    private final ApplicationEventPublisher eventPublisher;
    private final MessageSource messages;
//    private final JavaMailSender mailSender;

    private final UserRepository userRepository;

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
    public ModelAndView createNewUser(@ModelAttribute("user") @Valid UserDto userDto, BindingResult bindingResult,
                                      WebRequest request, Model model) {
        ModelAndView modelAndView = new ModelAndView();

        User registered = new User();
        if (!bindingResult.hasErrors()) {
            System.out.println(userDto.toString());
            registered = createUserAccount(userDto, bindingResult);
        }
        if (registered == null) {
            bindingResult.rejectValue("email", "message.regError");
        }
        try {
            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnRegistrationCompleteEvent(registered, request.getLocale(), appUrl));
        } catch (Exception me) {
            me.printStackTrace();
            return new ModelAndView("register", "user", userDto);
        }
        if (bindingResult.hasErrors()) {
            return new ModelAndView("register", "user", userDto);
        } else {
            return new ModelAndView("index", "user", userDto);
        }
    }

    @GetMapping("/registerConfirm")
    public String confirmRegistration(WebRequest request, Model model, @RequestParam("token") String token) {

        Locale locale = request.getLocale();

        VerificationToken verificationToken = userService.getVerificationToken(token);

        if (verificationToken == null) {
            String message = messages.getMessage("auth.message.invalidToken", null, locale);
            model.addAttribute("message", message);
            return "redirect:/badUser.html?lang=" + locale.getLanguage();
        }

        User user = verificationToken.getUser();
        Calendar calendar = Calendar.getInstance();

        if ((verificationToken.getExpiryDate().getTime() - calendar.getTime().getTime()) <= 0) {
            String messageValue = messages.getMessage("auth.message.expired", null, locale);
            model.addAttribute("message", messageValue);
            return "redirect:/badUser.html?lang=" + locale.getLanguage();
        }

        user.setEnabled(true);
        userService.saveRegisteredUser(user);
        return "redirect:/activationSuccess";
    }

    @GetMapping("/activationSuccess")
    public String showRegistrationSuccessPage() {
        return "registerConfirm";
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
