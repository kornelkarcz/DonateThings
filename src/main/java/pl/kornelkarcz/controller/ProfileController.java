//package pl.kornelkarcz.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//import pl.kornelkarcz.model.User;
//import pl.kornelkarcz.service.UserService;
//
//@Controller
//@RequestMapping("/profile")
//public class ProfileController {
//
//    @Autowired
//    private UserService userService;
//
//    @GetMapping("/")
//    public ModelAndView showProfilePage(Model model){
//        ModelAndView modelAndView = new ModelAndView();
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        User user = userService.findUserByEmail(authentication.getName());
//        model.addAttribute("loggedUser", user);
//        modelAndView.addObject("hello", "Hello, " + user.getFirstName() + " " +  user.getLastName() + "!");
//        modelAndView.setViewName("/profile/index");
//        return modelAndView;
//    }
//}
