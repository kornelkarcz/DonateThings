package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.kornelkarcz.config.CurrentUser;
import pl.kornelkarcz.repository.DonationRepository;
import pl.kornelkarcz.repository.UserRepository;
import pl.kornelkarcz.service.DonationService;
import pl.kornelkarcz.service.UserService;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final UserService userService;
    private final UserRepository userRepository;
    private final DonationRepository donationRepository;
    private final DonationService donationService;

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

    @ModelAttribute("firstName")
    public String getFirstName(@AuthenticationPrincipal Principal principal) {

        String firstName = "";
        if (principal != null) {
            firstName = userService.findUserByEmail(principal.getName()).getFirstName();
        }
        return firstName;
    }

    @ModelAttribute("numberOfUsers")
    public long getNumberOfUsers() {
        return userRepository.count();
    }

    @ModelAttribute("numberOfDonations")
    public long getNumberOfDonations() {
        return donationRepository.count();
    }

    @ModelAttribute("numberOfSupportedInstitutions")
    public long getCountOfSupportedInstitutions() {
        return donationService.countDistinctByInstitution();
    }
}
