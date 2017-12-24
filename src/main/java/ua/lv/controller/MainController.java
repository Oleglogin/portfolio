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



    @GetMapping("/")
    public String toWorkPage( Model model){
        model.addAttribute("workList", workService.workList());
        return "work";
    }


}
