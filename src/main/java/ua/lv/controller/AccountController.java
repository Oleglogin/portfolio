package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Account;
import ua.lv.entity.User;
import ua.lv.service.AccountService;
import ua.lv.service.UserService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class AccountController {
    @Autowired
    AccountService accountService;
    @Autowired
    UserService userService;

    @GetMapping("/account")
    public String toWelcome(Model model,
                            Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyAccount",new Account());
        return "account";
    }



    @RequestMapping(value = "saveAccount", method = RequestMethod.POST)
    public String addAccountSpringForm(@ModelAttribute("emptyAccount") @Valid Account account,
                                       Model model,
                                       Principal principal) {
        String principalName = principal.getName();
        User byUsername = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUsername);
        account.setUser(byUsername);
        accountService.addAccount(account);
        return "redirect:/myWorks";
    }

    @RequestMapping(value = "/editAccount/{id}")
    public String editAcc(@PathVariable("id") int id, Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName= userService.findByUserName(principalName);
        model.addAttribute("currentUser",byUserName);
        model.addAttribute("emptyAccount", accountService.getAccountById(id));
        return "/account";
    }





}
