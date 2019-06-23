package pl.kornelkarcz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.config.CurrentUser;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.UserService;

import javax.servlet.http.HttpSession;
import java.security.Principal;

@Controller
@SessionAttributes("loggedUser")
public class HomeController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public ModelAndView showHomePage(Model model, HttpSession session, Principal principal) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("welcome", "Welcome to DonateThings Homepage!");

        //TODO Uporządkować nazwy
        //TODO Ogarnąć if statement, żeby mnie nie wyrzucało z homepage jak nie jestem zalogowany

        User user = (User) session.getAttribute("loggedUser");
//        model.addAttribute("loggedUser", user);
        modelAndView.addObject("loggedUser", user);

//        boolean isLogged;
//
//        User sessionUser2 = userService.findUserByEmail(principal.getName());
//
//        if (sessionUser2 == null) {
//            isLogged = false;
//            session.setAttribute("isLogged", isLogged);
//            modelAndView.addObject("noSession", "Nie ma sesji i nie będzie");
//        } else {
//            isLogged = true;
//            session.setAttribute("isLogged", isLogged);
//            session.setAttribute("loggedUser2", sessionUser2);
//            model.addAttribute("loggedUser2", sessionUser2);
//            modelAndView.addObject("yesSession", "Jest sesja");
//        }


        modelAndView.setViewName("index");
        return modelAndView;
    }

    @GetMapping("/show")
    @ResponseBody
    public String showLoggedUserDetails(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        return "This is user: " + entityUser.getId();
    }
}
