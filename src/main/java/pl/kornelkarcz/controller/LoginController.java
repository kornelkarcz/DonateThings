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
import pl.kornelkarcz.dto.ChangePasswordDto;
import pl.kornelkarcz.dto.EmailDto;
import pl.kornelkarcz.dto.PasswordForgotDto;
import pl.kornelkarcz.dto.UserDto;
import pl.kornelkarcz.event.registration.OnRegistrationCompleteEvent;
import pl.kornelkarcz.event.resendToken.OnResendTokenEvent;
import pl.kornelkarcz.event.resetPassword.OnResetPassword;
import pl.kornelkarcz.model.PasswordResetToken;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.model.VerificationToken;
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
        return "login/login";
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
        return "login/loginSuccess";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model, @AuthenticationPrincipal Principal principal) {

        if (principal != null) {
            String username = principal.getName();
            model.addAttribute("firstName", userService.findUserByEmail(username).getFirstName());
        }

        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        return "register/register";
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
            return new ModelAndView("register/register", "user", userDto);
        }
        if (bindingResult.hasErrors()) {
            return new ModelAndView("register/register", "user", userDto);
        } else {
            return new ModelAndView("index", "user", userDto);
        }
    }

    @GetMapping("/registration-confirmed")
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
        return "redirect:/activation-success";
    }

    @GetMapping("/activation-success")
    public String showRegistrationSuccessPage() {
        return "register/confirmedRegistration";
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
        return new ModelAndView("user/forgotPassword", "emailDto", new EmailDto());
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
        modelAndView.setViewName("user/successForgotPassword");

        User user = userService.findUserByEmail(email);
        modelAndView.addObject("user", user.toString());

        try {
            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnResetPassword(user, request.getLocale(), appUrl));
        } catch (Exception me) {
            me.printStackTrace();
            return new ModelAndView("user/successForgotPassword", "user", user);
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
        modelAndView.setViewName("user/resetPassword");

        return new ModelAndView("user/resetPassword", "passwordForgotDto", new PasswordForgotDto());
    }

    @Transactional
    @PostMapping("/reset-password")
    public String resetUserPassword(@Valid @ModelAttribute("passwordForgotDto") PasswordForgotDto passwordForgotDto, BindingResult result,
                                    ModelAndView modelAndView, HttpSession session) {

        String resetToken = (String) session.getAttribute("resetToken");
        modelAndView.addObject("resetToken", resetToken);

        if (!result.hasErrors()) {
            PasswordResetToken token = userService.getPasswordResetToken(resetToken);
            User user = token.getUser();
            String resetPassword = encoder.encode(passwordForgotDto.getNewPassword());
            userService.updatePassword(resetPassword, user.getId());
            resetTokenRepository.delete(token);

            modelAndView.addObject("message", "Your password has been successfully reset");
        }
        return "redirect:/success-reset-password";
    }

    @GetMapping("/success-reset-password")
    public String getCheckView() {
        return "user/successResetPassword";
    }

    @GetMapping("/logout_success")
    public ModelAndView getLogout(ModelAndView modelAndView) {
        modelAndView.addObject("message", "See you again soon!");
        modelAndView.setViewName("login/logout");
        return modelAndView;
    }

    @GetMapping("/change-password")
    public String changePassword(Model model) {
        model.addAttribute("changePasswordDto", new ChangePasswordDto());
        return "user/changePassword";
    }

    @Transactional
    @PostMapping("/change-password")
    public String changePassword(@Valid @ModelAttribute("changePasswordDto") ChangePasswordDto changePasswordDto,
                                 BindingResult bindingResult, @AuthenticationPrincipal CurrentUser currentUser, Model model) {

        if (userService.verifyUser(currentUser.getUser(), changePasswordDto.getOldPassword()) && !bindingResult.hasErrors()) {
            userService.updatePassword(encoder.encode(changePasswordDto.getNewPassword()), currentUser.getUser().getId());
            return "redirect:/profile/";
        } else {
            model.addAttribute("errors", bindingResult.getAllErrors());
            System.out.println(bindingResult.getAllErrors().toString());
            return "user/changePassword";
        }
    }


    @GetMapping("/resend-token")
    public String showResendTokenPage() {
        return "register/resendToken";
    }

    @Transactional
    @PostMapping("/resend-token")
    public ModelAndView tokenResent(@AuthenticationPrincipal CurrentUser currentUser,
                                    ModelMap model, WebRequest request) {

        ModelAndView modelAndView = new ModelAndView();

        String email = currentUser.getUser().getEmail();
        model.addAttribute("email", email);
        modelAndView.setViewName("register/successResendToken");

        User user = userService.findUserByEmail(email);
        modelAndView.addObject("user", user.getFirstName());

        try {
            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnResendTokenEvent(user, request.getLocale(), appUrl));
        } catch (Exception me) {
            me.printStackTrace();
            return new ModelAndView("register/successResendToken", "user", user);
        }
        return modelAndView;
    }

    @GetMapping("/activate-account")
    public String activateAccount(WebRequest request, ModelAndView modelAndView,
                                  @RequestParam("token") String token, Model model) {

        Locale locale = request.getLocale();
        model.addAttribute("token", token);

        VerificationToken activationToken = userService.getVerificationToken(token);

        if (activationToken == null) {
            String message = messages.getMessage("auth.message.invalidToken", null, locale);
            model.addAttribute("message", message);
            return "403";
        }

        User user = activationToken.getUser();
        Calendar calendar = Calendar.getInstance();

        if ((activationToken.getExpiryDate().getTime() - calendar.getTime().getTime()) <= 0) {
            String messageValue = messages.getMessage("auth.message.expired", null, locale);
            model.addAttribute("message", messageValue);
            return "403";
        }

        user.setEnabled(true);
        userService.saveRegisteredUser(user);
        return "redirect:/activation-success";
    }

    @ModelAttribute("firstName")
    public String getFirstName(@AuthenticationPrincipal Principal principal) {
        String firstName = "";
        if (principal != null) {
            firstName = userService.findUserByEmail(principal.getName()).getFirstName();
        }
        return firstName;
    }
}