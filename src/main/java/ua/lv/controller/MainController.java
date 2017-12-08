package ua.lv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class MainController {

    @GetMapping("/index")
    public String toIndex(){
        return "/index";
    }

    @GetMapping("/")
    public String toWorkPage(){
        return "index";
    }
}
