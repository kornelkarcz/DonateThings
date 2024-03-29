package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.model.Collection;
import pl.kornelkarcz.model.Donation;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.CollectionService;
import pl.kornelkarcz.service.DonationService;
import pl.kornelkarcz.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserService userService;
    private final DonationService donationService;
    private final CollectionService collectionService;

    @GetMapping("/")
    public ModelAndView showProfilePage(@AuthenticationPrincipal Principal principal) {
        ModelAndView modelAndView = new ModelAndView();

        User loggedUser = userService.findUserByEmail(principal.getName());
        boolean isEnabled = loggedUser.getEnabled();


        if (isEnabled) {
            modelAndView.addObject("firstName", loggedUser.getFirstName());
            modelAndView.setViewName("user/profilePage");
        } else {
            return new ModelAndView("redirect:/resend-token");
        }

        return modelAndView;
    }

    @GetMapping("/edit-personal-details")
    public String getEditPersonalDetailsPage(Model model, @AuthenticationPrincipal Principal principal) {
        User loggedUser = userService.findUserByEmail(principal.getName());
        model.addAttribute("user", loggedUser);
        return "user/editPersonalDetails";
    }

    @Transactional
    @PostMapping("/edit-personal-details")
    public String savePersonalDetailsChanges(@ModelAttribute("user") User user, BindingResult result, Model model, @AuthenticationPrincipal Principal principal) {

        User currentUser = userService.findUserByEmail(principal.getName());
        if (!result.hasErrors()) {
            userService.updatePersonalDetails(user.getFirstName(), user.getLastName(), currentUser.getId());
            return "redirect:/profile/";
        }
        return "user/profilePage";
    }

    @GetMapping("/donation/details/{id}")
    public String getDonationDetails(Model model, @PathVariable Long id){
        model.addAttribute("donation", donationService.findById(id).get());
        return "donation/profileDonationDetails";
    }

    @GetMapping("/collection/details/{id}")
    public String getCollectionDetails(Model model, @PathVariable Long id) {
        model.addAttribute("collection", collectionService.findById(id).get());
        return "collection/profileCollectionDetails";
    }

    @ModelAttribute("userDetails")
    public User getUserDetails(@AuthenticationPrincipal Principal principal) {
        return userService.findUserByEmail(principal.getName());
    }

    @ModelAttribute("firstName")
    public String getUserFirstName(@AuthenticationPrincipal Principal principal) {
        return userService.findUserByEmail(principal.getName()).getFirstName();
    }

    @ModelAttribute("donations")
    public List<Donation> getUserDonations(@AuthenticationPrincipal Principal principal) {
        Long userId = userService.findUserByEmail(principal.getName()).getId();
        return donationService.getUserAllDonations(userId);
    }

    @ModelAttribute("collections")
    public List<Collection> getUserCollection(@AuthenticationPrincipal Principal principal) {
        Long userId = userService.findUserByEmail(principal.getName()).getId();
        return collectionService.getUserAllCollections(userId);
    }
}
