package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.kornelkarcz.model.Collection;
import pl.kornelkarcz.model.Donation;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final InstitutionService institutionService;
    private final AddressService addressService;
    private final UserService userService;
    private final DonationService donationService;
    private final CollectionService collectionService;

    @GetMapping("/admin")
    public String showAdminPanel() {
        return "admin/admin";
    }

    @GetMapping("/admin/addInstitution")
    public String addInstitution(Model model) {
        model.addAttribute("institution", new Institution());
        return "institution/addInstitution";
    }

    @PostMapping("/admin/addInstitution")
    public String saveInstitution(@Valid Institution institution, BindingResult result) {
        if (!result.hasErrors()) {
            addressService.save(institution.getAddress());
            institutionService.save(institution);
        } else {
            return "redirect:/403";
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/institution/edit/{id}")
    public String updateInstitution(Model model, @PathVariable Long id) {
        model.addAttribute("institution", institutionService.findById(id));
        return "institution/editInstitution";
    }

    @PostMapping("/admin/institution/edit")
    public String updateInstitution(@Valid Institution institution, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            institutionService.save(institution);
            return "redirect:/admin/allInstitutions";
        }

        return "redirect:/admin/";
    }

    @GetMapping("/admin/institution/details/{id}")
    public String getInstitutionDetails(Model model, @PathVariable Long id) {
        model.addAttribute("institution", institutionService.findById(id).get());
        return "institution/detailsInstitution";
    }

    @GetMapping("/admin/institution/delete/{id}")
    public String deleteInstitution(@PathVariable Long id) {
        institutionService.delete(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/donation/edit/{id}")
    public String updateDonation(Model model, @PathVariable Long id) {
        model.addAttribute("donation", donationService.findById(id).get());
        return "donation/editDonation";
    }

    @PostMapping("/admin/donation/edit")
    public String updateDonation(@Valid Donation donation, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            donationService.save(donation);
            return "redirect:/admin";
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/donation/details/{id}")
    public String getDonationDetails(Model model, @PathVariable Long id) {
        model.addAttribute("donation", donationService.findById(id).get());
        return "donation/detailsDonation";
    }

    @GetMapping("/admin/donation/delete/{id}")
    public String deleteDonation(@PathVariable Long id) {
        donationService.delete(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/collection/edit/{id}")
    public String updateCollection(Model model, @PathVariable Long id) {
        model.addAttribute("collection", collectionService.findById(id).get());
        return "collection/editCollection";
    }

    @PostMapping("/admin/collection/edit")
    public String updateCollection(@Valid Collection collection, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            collectionService.save(collection);
            return "redirect:/admin";
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/collection/details/{id}")
    public String getCollectionDetails(Model model, @PathVariable Long id) {
        model.addAttribute("collection", collectionService.findById(id).get());
        return "collection/detailsCollection";
    }

    @GetMapping("/admin/collection/delete/{id}")
    public String deleteCollection(@PathVariable Long id) {
        collectionService.delete(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/details/{id}")
    public String getUserDetails(Model model, @PathVariable Long id) {
        model.addAttribute("user", userService.findById(id).get());
        return "user/userDetails";
    }

    @GetMapping("/admin/user/edit/{id}")
    public String editUser(Model model, @PathVariable Long id) {

        String userEmail = userService.findById(id).get().getEmail();
        model.addAttribute("editedUser", userService.findUserByEmail(userEmail));

        return "admin/editUser";
    }

    @Transactional
    @PostMapping("/admin/user/edit")
    public String editUser(@ModelAttribute("editedUser") User user, BindingResult result) {

        if (!result.hasErrors()) {
            userService.updatePersonalDetails(user.getFirstName(), user.getLastName(), user.getId());
            return "redirect:/admin";
        }
        return "admin/admin";
    }

    @Transactional
    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "redirect:/admin";
    }

    @ModelAttribute("firstName")
    public String getFirstName(@AuthenticationPrincipal Principal principal) {
        return userService.findUserByEmail(principal.getName()).getFirstName();
    }

    @ModelAttribute("institutions")
    public List<Institution> getAllInstitutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("users")
    public List<User> getAllUsers() {
        return userService.findAll();
    }

    @ModelAttribute("donations")
    public List<Donation> getAllDonaions() {
        return donationService.findAll();
    }

    @ModelAttribute("collections")
    public List<Collection> getAllCollections() {
        return collectionService.findAll();
    }
}
