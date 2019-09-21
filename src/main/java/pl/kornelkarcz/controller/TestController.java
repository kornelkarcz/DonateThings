package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.kornelkarcz.model.Donation;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.service.DonationService;
import pl.kornelkarcz.service.InstitutionService;
import pl.kornelkarcz.service.UserService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class TestController {

    private final UserService userService;
    private final InstitutionService institutionService;
    private final DonationService donationService;

    @GetMapping("/test")
    public String displayTestView(Model model, @AuthenticationPrincipal Principal principal) {
        //String firstName = userService.findUserByEmail(principal.getName()).getFirstName();
        //model.addAttribute("firstName", firstName);
        model.addAttribute("donation", new Donation());
        return "test";
    }

    @PostMapping("/test")
    public String registerDonation(@Valid Donation donation, BindingResult result) {

        if (!result.hasErrors()) {
            donation.setUser(userService.findUserByEmail("kornel.karcz@gmail.com"));
            donationService.save(donation);
        }
        return "redirect:/index";
    }

    @ModelAttribute("institutions")
    public List<Institution> getInstitutions() {
        return institutionService.findAll();
    }

}
