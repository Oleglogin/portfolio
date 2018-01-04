package ua.lv.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Account;
import ua.lv.entity.Rating;
import ua.lv.entity.User;
import ua.lv.entity.Work;
import ua.lv.service.AccountService;
import ua.lv.service.RatingService;
import ua.lv.service.UserService;
import ua.lv.service.WorkService;


import java.security.Principal;
import java.util.List;

@Controller
public class WorkController {

    @Autowired
    WorkService workService;
    @Autowired
    UserService userService;
    @Autowired
    AccountService accountService;
    @Autowired
    RatingService ratingService;

    @GetMapping(value = "/work")
    public String goWork(Model model, Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);
        model.addAttribute("workList", workService.workList());
        model.addAttribute("CategoryDesign", workService.findAllByCategory( "Design"));
        model.addAttribute("CategoryArchitecture", workService.findAllByCategory( "Architecture"));
        model.addAttribute("Category3D_Model", workService.findAllByCategory( "3D_Model"));
        model.addAttribute("emptyRating", new Rating());
        return "/work";
    }

    @RequestMapping(value = "/work/add", method = RequestMethod.POST)
    public String addWork(@ModelAttribute("emptyWork") Work work,Model model, Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);
        work.setUser(byUsername);
        workService.addWork(work);
        return "redirect:/myWorks";
    }

    @RequestMapping(value = "/workData/{id}", method = RequestMethod.GET)
    public String workData(@PathVariable("id") int id, Model model,@ModelAttribute("emptyRating") Rating rating){
        model.addAttribute("work", workService.getWorkById(id));
        Work byWorkId = workService.getWorkById(id);
        rating.setWork(byWorkId);
        ratingService.addRating(rating);
        model.addAttribute("countRating", ratingService.countRating(byWorkId.getId()));
        return "workData";
    }

    @RequestMapping(value = "/userWork/{id}", method = RequestMethod.GET)
    public String userWork(@PathVariable("id") int id, Model model,Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);
        model.addAttribute("works", workService.userWork(id));
        return "/userWork";
    }


    @RequestMapping(value = "/workRemove/{id}")
    public String removeWork(@PathVariable("id") int id){
        workService.removeWork(id);
        return "redirect:/myWorks";
    }

    @RequestMapping(value = "/workEdit/{id}")
    public String editWork(@PathVariable("id") int id, Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName= userService.findByUserName(principalName);
        model.addAttribute("currentUser",byUserName);
        model.addAttribute("emptyWork", workService.getWorkById(id));
        model.addAttribute("workList", workService.workList());
        model.addAttribute("countCategoryDesign", workService.findAllByCategoryIs(byUserName.getId(), "Design"));
        model.addAttribute("countCategoryArchitecture", workService.findAllByCategoryIs(byUserName.getId(), "Architecture"));
        model.addAttribute("countCategory3D_Model", workService.findAllByCategoryIs(byUserName.getId(), "3D_Model"));
        return "myWork";
    }
    @RequestMapping(value = "/myWorks")
    public String myWorks(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName= userService.findByUserName(principalName);
        model.addAttribute("accountList", accountService.listAccount());
        model.addAttribute("currentUser",byUserName);
        model.addAttribute("emptyWork", new Work());
        model.addAttribute("workList", workService.workList());
        model.addAttribute("countAcc", accountService.CountAccount(byUserName.getId()));
        model.addAttribute("countCategoryDesign", workService.findAllByCategoryIs(byUserName.getId(), "Design"));
        model.addAttribute("countCategoryArchitecture", workService.findAllByCategoryIs(byUserName.getId(), "Architecture"));
        model.addAttribute("countCategory3D_Model", workService.findAllByCategoryIs(byUserName.getId(), "3D_Model"));
        return "myWork";
    }

    @RequestMapping(value = "/categoryList/{category}")
    public String categoryList(Model model, Principal principal,@PathVariable("category")String category){
        String principalName = principal.getName();
        User byUserName= userService.findByUserName(principalName);
        model.addAttribute("currentUser",byUserName);
        model.addAttribute("CategoryDesign", workService.findAllByCategory( "Design"));
        model.addAttribute("CategoryArchitecture", workService.findAllByCategory( "Architecture"));
        model.addAttribute("Category3D_Model", workService.findAllByCategory( "3D_Model"));
        model.addAttribute("workList",workService.workCategory(category));
        return "/work";
    }
}
