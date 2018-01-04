package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.Rating;
import ua.lv.entity.User;
import ua.lv.entity.Work;
import ua.lv.service.RatingService;
import ua.lv.service.UserService;
import ua.lv.service.WorkService;

import java.security.Principal;

/**
 * Created by User on 03.01.2018.
 */
@Controller
public class RatingController {
    @Autowired
    RatingService ratingService;
    @Autowired
    UserService userService;
    @Autowired
    WorkService workService;
    @RequestMapping(value = "ratingAdd/{work.id}", method = RequestMethod.POST)
    public String addRating(@ModelAttribute("emptyRating") Rating rating,
                            Model model,Principal principal,
                            @PathVariable("work.id") int id){
//        String principalName = principal.getName();
//        User byUsername = userService.findByUserName(principalName);
//        model.addAttribute("currentUser", byUsername);
//        model.addAttribute("workList", workService.workList());
//        model.addAttribute("CategoryDesign", workService.findAllByCategory( "Design"));
//        model.addAttribute("CategoryArchitecture", workService.findAllByCategory( "Architecture"));
//        model.addAttribute("Category3D_Model", workService.findAllByCategory( "3D_Model"));
//        model.addAttribute("emptyRating", new Rating());

        Work byWorkId = workService.getWorkById(id);
        rating.setWork(byWorkId);
        ratingService.addRating(rating);
//        model.addAttribute("countRating", ratingService.countRating(byWorkId.getId()));
        return "redirect:/work";
    }
}
