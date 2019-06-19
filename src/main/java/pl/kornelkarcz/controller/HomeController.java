package pl.kornelkarcz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pl.kornelkarcz.model.User;
import pl.kornelkarcz.service.UserService;

@Controller
public class HomeController {

//    @Autowired
//    private UserService userService;

    @GetMapping("/")
    public ModelAndView showHomePage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("welcome", "Welcome to DonateThings Homepage!");
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        User user = userService.findUserByEmail(authentication.getName());
//        modelAndView.addObject("Hello", "Hello, " + user.getFirstName() + "!");
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
