package ua.lv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class AccessDeniedController {
    @RequestMapping(value = "/accessDenied",method = RequestMethod.GET)
    public ModelAndView accessDenied(Principal user){
        ModelAndView modelAndView = new ModelAndView();

        if(user != null){
            modelAndView.addObject("errorMsg",user.getName() + " \n" +
                    "you do not have access to the site");
        }else  {
            modelAndView.addObject("errorMsg"," у вас немає доступу до цієї сторінки");
        }
        modelAndView.setViewName("/accessDenied");
        return modelAndView;
    }
}
