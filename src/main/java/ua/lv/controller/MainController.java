package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import ua.lv.entity.User;
import ua.lv.entity.Work;
import ua.lv.service.UserService;
import ua.lv.service.WorkService;

import java.security.Principal;

@Controller
public class MainController {


    @Autowired
    WorkService workService;
    @Autowired
    UserService userService;



    @GetMapping("/")
    public String toWorkPage( Model model){
        model.addAttribute("workList", workService.workList());
        model.addAttribute("CategoryDesign", workService.findAllByCategory( "Design"));
        model.addAttribute("CategoryArchitecture", workService.findAllByCategory( "Architecture"));
        model.addAttribute("Category3D_Model", workService.findAllByCategory( "3D_Model"));
        model.addAttribute("allUsers",userService.AllUsers());
        model.addAttribute("allWorks",workService.findAllWorks());
        return "work";
    }


}
