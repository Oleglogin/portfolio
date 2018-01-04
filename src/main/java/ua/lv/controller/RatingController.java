package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.Rating;
import ua.lv.entity.Work;
import ua.lv.service.RatingService;
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
    WorkService workService;
    @RequestMapping(value = "ratingAdd/{work.id}", method = RequestMethod.POST)
    public String addRating(@ModelAttribute("emptyRating") Rating rating,
                            Model model,
                            @PathVariable("work.id") int id){
        Work byWorkId = workService.getWorkById(id);
        rating.setWork(byWorkId);
        ratingService.addRating(rating);
        model.addAttribute("countRating", ratingService.countRating(byWorkId.getId()));
        return "redirect:/work";
    }
}
