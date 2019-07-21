package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.config.CurrentUser;
import pl.kornelkarcz.dto.EmailDto;
import pl.kornelkarcz.dto.PasswordForgotDto;
import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.event.resetPassword.OnResetPassword;
import pl.kornelkarcz.model.PasswordResetToken;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;
import pl.kornelkarcz.event.registration.OnRegistrationCompleteEvent;
import pl.kornelkarcz.repository.PasswordResetTokenRepository;
import pl.kornelkarcz.repository.UserRepository;
import pl.kornelkarcz.service.UserService;
import pl.kornelkarcz.validator.EmailExistsException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.Calendar;
import java.util.Locale;


@Controller
@RequiredArgsConstructor
@SessionAttributes({"loggedUser", "token", "resetToken"})
public class LoginController {

    private final UserService userService;
    private final ApplicationEventPublisher eventPublisher;
    private final MessageSource messages;
    private final PasswordResetTokenRepository resetTokenRepository;

    private final BCryptPasswordEncoder encoder;
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
        String name = loggedUser.getFirstName();
        model.addAttribute("firstName", name);
        String successLogin = "Hello, " + id + "," + name + ", you have successfully logged in";
        model.addAttribute("logSuccessMessage", successLogin);
        return "loginSuccess";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model, @AuthenticationPrincipal Principal principal) {

        if (principal != null) {
            String username = principal.getName();
            model.addAttribute("firstName", userService.findUserByEmail(username).getFirstName());
        }

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

    @GetMapping("/forgot-password")
    public ModelAndView displayResetPassword() {
        return new ModelAndView("forgotPassword", "emailDto", new EmailDto());
    }

    @PostMapping("/forgot-password")
    public ModelAndView forgotUserPassword(@Valid @ModelAttribute("emailDto") EmailDto emailDto, BindingResult result,
                                           ModelMap model, WebRequest request) {

        ModelAndView modelAndView = new ModelAndView();

        if (result.hasErrors()) {
            modelAndView.setViewName("403");
            return modelAndView;
        }

        String email = emailDto.getEmail();
        model.addAttribute("email", email);
        modelAndView.setViewName("successForgotPassword");

        User user = userService.findUserByEmail(email);
        modelAndView.addObject("user", user.toString());

        try {
            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnResetPassword(user, request.getLocale(), appUrl));
        } catch (Exception me) {
            me.printStackTrace();
            return new ModelAndView("successForgotPassword", "user", user);
        }

        return modelAndView;
    }

    @GetMapping("/confirm-reset")
    public ModelAndView validateResetToken(WebRequest request, ModelAndView modelAndView,
                                           @RequestParam("token") String resetToken, Model model) {

        Locale locale = request.getLocale();
        model.addAttribute("resetToken", resetToken);

        PasswordResetToken token = userService.getPasswordResetToken(resetToken);

        if (token == null) {
            String message = messages.getMessage("auth.message.invalidToken", null, locale);
            modelAndView.addObject("message", message);
            return new ModelAndView("403");
        }

        User user = token.getUser();
        Calendar calendar = Calendar.getInstance();

        if ((token.getExpiryDate().getTime() - calendar.getTime().getTime()) <= 0) {
            String messageValue = messages.getMessage("auth.message.expired", null, locale);
            modelAndView.addObject("message", messageValue);
            modelAndView.setViewName("403");
            return modelAndView;
        }


        modelAndView.addObject("email", user.getEmail());
        modelAndView.setViewName("resetPassword");

        return new ModelAndView("resetPassword", "passwordForgotDto", new PasswordForgotDto());
    }

    @PostMapping("/reset-password")
    @Transactional
    public String resetUserPassword(@Valid @ModelAttribute("passwordForgotDto") PasswordForgotDto passwordForgotDto, BindingResult result,
                                    ModelAndView modelAndView, HttpSession session) {

        String resetToken = (String) session.getAttribute("resetToken");
        //TODO Usunac pozniej
        modelAndView.addObject("resetToken", resetToken);
        //TODO dopisac binding result i flow poprawic

        PasswordResetToken token = userService.getPasswordResetToken(resetToken);
        User user = token.getUser();
        String resetPassword = encoder.encode(passwordForgotDto.getNewPassword());
        userService.updatePassword(resetPassword, user.getId());
        resetTokenRepository.delete(token);

        modelAndView.addObject("message", "Your password has been successfully reset");

        return "redirect:/success-reset-password";
    }

    @GetMapping("/success-reset-password")
    public String getCheckView() {
        return "successResetPassword";
    }

    @GetMapping("/logout_success")
    public ModelAndView getLogout(ModelAndView modelAndView) {
        modelAndView.addObject("message", "See you again soon!");
        modelAndView.setViewName("logout");
        return modelAndView;
    }

}