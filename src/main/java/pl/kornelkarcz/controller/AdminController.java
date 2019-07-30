package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.service.AddressService;
import pl.kornelkarcz.service.InstitutionService;
import pl.kornelkarcz.service.UserService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final InstitutionService institutionService;
    private final AddressService addressService;
    private final UserService userService;

    @GetMapping("/admin")
    public String showAdminPanel() {
        return "admin";
    }

    @GetMapping("/admin/addInstitution")
    public String addInstitution(Model model, @AuthenticationPrincipal Principal principal) {
        String firstName = userService.findUserByEmail(principal.getName()).getFirstName();
        model.addAttribute("firstName", firstName);
        model.addAttribute("institution", new Institution());
        return "addInstitution";
    }

    @PostMapping("/admin/addInstitution")
    public String saveInstitution(@Valid Institution institution, BindingResult result) {
        if (!result.hasErrors()) {
            addressService.save(institution.getAddress());
            institutionService.save(institution);
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/allInstitutions")
    public String getAllInsitutions(Model model, @AuthenticationPrincipal Principal principal) {
        String firstName = userService.findUserByEmail(principal.getName()).getFirstName();
        model.addAttribute("firstName", firstName);
        model.addAttribute("institutions", institutionService.findAll());
        return "allInstitutions";
    }

    @GetMapping("/admin/institution/edit/{id}")
    public String updateInstitution(Model model, @PathVariable Long id, @AuthenticationPrincipal Principal principal) {
        String firstName = userService.findUserByEmail(principal.getName()).getFirstName();
        model.addAttribute("firstName", firstName);
        model.addAttribute("institution", institutionService.findById(id));
        return "editInstitution";
    }

    @PostMapping("/admin/institution/edit")
    public String updateInstitution(@Valid Institution institution, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            institutionService.save(institution);
            return "redirect:/admin/allInstitutions";
        }

        return "redirect:/admin/";
    }

    @GetMapping("/admin/institution/delete/{id}")
    public String deleteInstitution(@PathVariable Long id) {
        institutionService.delete(id);
        return "redirect:/admin/allInstitutions";
    }

    @GetMapping("/admin/allUsers")
    public String getAllUsers(Model model, @AuthenticationPrincipal Principal principal) {
        String firstName = userService.findUserByEmail(principal.getName()).getFirstName();
        model.addAttribute("firstName", firstName);
        model.addAttribute("users", userService.findAll());
        return "allUsers";

    }
}
