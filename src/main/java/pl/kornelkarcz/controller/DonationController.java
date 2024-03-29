package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import pl.kornelkarcz.event.donate.OnDonationEvent;
import pl.kornelkarcz.model.Donation;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.DonationService;
import pl.kornelkarcz.service.InstitutionService;
import pl.kornelkarcz.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
@SessionAttributes("donationId")
public class DonationController {

    private final UserService userService;
    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final ApplicationEventPublisher eventPublisher;

    @GetMapping("/donate")
    public String showDonationPage(Model model) {
        model.addAttribute("donation", new Donation());
        return "donation/donate";
    }

    @PostMapping("/donate")
    public String registerDonation(@Valid Donation donation, BindingResult result,
                                   @AuthenticationPrincipal Principal principal, WebRequest request, Model model) {
        if (!result.hasErrors()) {
            donation.setUser(userService.findUserByEmail(principal.getName()));
            donationService.save(donation);

            Long donationId = donation.getId();
            model.addAttribute("donationId", donationId);

            User logged = userService.findUserByEmail(principal.getName());

            try {
                eventPublisher.publishEvent(new OnDonationEvent(logged, request.getLocale()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            return "redirect:/";
        }
        return "redirect:/donation/summary";
    }

    @GetMapping("/donation/summary")
    public String showLastDonation(Model model, HttpSession session) {

        Long sessionAttribute = (Long) session.getAttribute("donationId");

        Donation lastDonation = donationService.findById(sessionAttribute).get();
        model.addAttribute("lastDonation", lastDonation);

        return "donation/donation-summary";
    }

    @ModelAttribute("firstName")
    public String getFirstName(@AuthenticationPrincipal Principal principal) {
        return userService.findUserByEmail(principal.getName()).getFirstName();
    }

    @ModelAttribute("institutions")
    public List<Institution> getInstitutions() {
        return institutionService.findAll();
    }
}
