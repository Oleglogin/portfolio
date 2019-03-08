package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Rating;
import ua.lv.entity.User;
import ua.lv.entity.Work;
import ua.lv.service.AccountService;
import ua.lv.service.RatingService;
import ua.lv.service.UserService;
import ua.lv.service.WorkService;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.TimeUnit;

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
        model.addAttribute("workList",workService.sortList());
        model.addAttribute("CategoryDesign", workService.findAllByCategory( "Design"));
        model.addAttribute("CategoryArchitecture", workService.findAllByCategory( "Architecture"));
        model.addAttribute("Category3D_Model", workService.findAllByCategory( "3D_Model"));
        model.addAttribute("emptyRating", new Rating());
        model.addAttribute("allUsers",userService.AllUsers());
        model.addAttribute("allWorks",workService.findAllWorks());
        model.addAttribute("ratingList", ratingService.listRating());
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
    public String workData(@PathVariable("id") int id, Model model,@ModelAttribute("emptyRating") Rating rating,Principal principal){
        model.addAttribute("work", workService.getWorkById(id));
        Work byWorkId = workService.getWorkById(id);
        rating.setWork(byWorkId);
        ratingService.addRating(rating);
        model.addAttribute("countRating", ratingService.countRating(byWorkId.getId())-1);
        model.addAttribute("sumRating", ratingService.sunRating(byWorkId.getId()));
        model.addAttribute("userRating", ratingService.findUsersRating(byWorkId.getId()));

        double a = ratingService.sunRating(byWorkId.getId());
        double b = ratingService.countRating(byWorkId.getId())-1;
        if(b >= 1){
            double arit = a/b;
            double arithmetic = new BigDecimal(arit).setScale(1, RoundingMode.UP).doubleValue();
            model.addAttribute("arithmetic",arithmetic);
        }
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);
        return "/workData";
    }

    @RequestMapping(value = "/userWork/{id}", method = RequestMethod.GET)
    public String userWork(@PathVariable("id") int id, Model model,Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);
        model.addAttribute("work", workService.userWork(id));
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
        model.addAttribute("currentUser",byUserName);
        model.addAttribute("accountList", accountService.listAccount());
        model.addAttribute("emptyWork", new Work());
        model.addAttribute("workList", workService.sortList());
        model.addAttribute("countAcc", accountService.CountAccount(byUserName.getId()));

//        model.addAttribute("countCategoryDesign", workService.findAllByCategoryIs(byUserName.getId(), "Design"));
//        model.addAttribute("countCategoryArchitecture", workService.findAllByCategoryIs(byUserName.getId(), "Architecture"));
//        model.addAttribute("countCategory3D_Model", workService.findAllByCategoryIs(byUserName.getId(), "3D_Model"));

        Date date = new Date();
        Date date1 = byUserName.getDateOfRegistration();
        long diff = date.getTime() - date1.getTime();
        long days = TimeUnit.MILLISECONDS.toDays(diff)+1;
        model.addAttribute("daysWithUs", days);
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
        model.addAttribute("emptyRating", new Rating());
        model.addAttribute("allUsers",userService.AllUsers());
        model.addAttribute("allWorks",workService.findAllWorks());
        model.addAttribute("categoryAccount",accountService.categoryAccount(category));
        return "/work";
    }

    @RequestMapping(value = "/workFindOfDate")
    public String workFindOfDate(Principal principal, Model model) {
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);

        model.addAttribute("workList", workService.workList());


        model.addAttribute("CategoryDesign", workService.findAllByCategory("Design"));
        model.addAttribute("CategoryArchitecture", workService.findAllByCategory("Architecture"));
        model.addAttribute("Category3D_Model", workService.findAllByCategory("3D_Model"));
        model.addAttribute("emptyRating", new Rating());
        model.addAttribute("allUsers", userService.AllUsers());
        model.addAttribute("allWorks", workService.findAllWorks());

        model.addAttribute("ratingList", ratingService.listRating());
        return "work";
    }
}
