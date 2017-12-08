package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.service.UserService;

@Controller
public class AdminController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String toAdmin(Model model){
        model.addAttribute("usersList", userService.listUsers());
        return "admin";
    }
}
