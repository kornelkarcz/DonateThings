package pl.kornelkarcz.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import pl.kornelkarcz.event.collect.OnCollectionEvent;
import pl.kornelkarcz.model.Collection;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.CollectionService;
import pl.kornelkarcz.service.InstitutionService;
import pl.kornelkarcz.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
@SessionAttributes("collectionId")
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
                                     @AuthenticationPrincipal Principal principal, WebRequest request, Model model) {
        if (!result.hasErrors()) {
            collection.setUser(userService.findUserByEmail(principal.getName()));
            collectionService.save(collection);

            Long collectionId = collection.getId();
            model.addAttribute("collectionId", collectionId);

            User logged = userService.findUserByEmail(principal.getName());
            List<String> usersEmails = userService.getUsersEmails();

            try {
                eventPublisher.publishEvent(new OnCollectionEvent(logged, usersEmails, request.getLocale()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            return "redirect:/";
        }
        return "redirect:/collection/summary";

    }

    @GetMapping("/collection/summary")
    public String showLastCollection(Model model, HttpSession session) {

        Long sessionAttribute = (Long) session.getAttribute("collectionId");

        Collection lastCollection = collectionService.findById(sessionAttribute).get();
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
