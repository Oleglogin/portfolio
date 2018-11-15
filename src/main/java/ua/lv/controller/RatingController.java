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
    @RequestMapping(value = "ratingAdd/{work.id}/{currentUser.id}", method = RequestMethod.POST)
    public String addRating(@ModelAttribute("emptyRating") Rating rating,
                            @PathVariable("work.id") int id,
                            @PathVariable("currentUser.id") int userId){
        Work byWorkId = workService.getWorkById(id);
        User byUserId = userService.getUserById(userId);
        rating.setWork(byWorkId);
        rating.setUser(byUserId);
        ratingService.addRating(rating);
        return "redirect:/work";
    }
}
