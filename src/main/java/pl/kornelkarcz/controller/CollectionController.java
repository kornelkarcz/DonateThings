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
import org.springframework.web.context.request.WebRequest;
import pl.kornelkarcz.event.collect.OnCollectionEvent;
import pl.kornelkarcz.model.Collection;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.CollectionService;
import pl.kornelkarcz.service.InstitutionService;
import pl.kornelkarcz.service.UserService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CollectionController {

    private final UserService userService;
    private final InstitutionService institutionService;
    private final CollectionService collectionService;
    private final ApplicationEventPublisher eventPublisher;

    @GetMapping("/organize-collection")
    public String showCollectionPage(Model model) {
        model.addAttribute("collection", new Collection());
        return "collection/collect";
    }

    @PostMapping("/organize-collection")
    public String registerCollection(@Valid Collection collection, BindingResult result,
                                     @AuthenticationPrincipal Principal principal, WebRequest request) {
        if (!result.hasErrors()) {
            collection.setUser(userService.findUserByEmail(principal.getName()));
            collectionService.save(collection);
        }

        User logged = userService.findUserByEmail(principal.getName());
        List<String> usersEmails = userService.getUsersEmails();

        try {
            eventPublisher.publishEvent(new OnCollectionEvent(logged, usersEmails, request.getLocale()));
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/collection/summary";
        }
        return "redirect:/collection/summary";
    }

    @GetMapping("/collection/summary")
    public String showLastCollection(@AuthenticationPrincipal Principal principal, Model model) {

        Long id = userService.findUserByEmail(principal.getName()).getId();
        Collection lastCollection = collectionService.findByUserIdLastCollection(id);
        model.addAttribute("lastCollection", lastCollection);

        return "collection/collection-summary";
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
