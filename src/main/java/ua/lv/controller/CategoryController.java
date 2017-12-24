package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Category;
import ua.lv.service.CategoryService;

@Controller
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @GetMapping("/category")
    public String category(Model model){
        model.addAttribute("emptyCategory", new Category());
        model.addAttribute("listCategory", categoryService.categorysList());
        return "/category";
    }

    @RequestMapping(value = "/category/add", method = RequestMethod.POST)
    public String addCategory(@ModelAttribute("emptyCategory") Category category){
        categoryService.addCategory(category);
        return "redirect:/category";
    }
    @RequestMapping("/removeCategory/{id}")
    public String removeCategory(@PathVariable("id") int id){
        categoryService.removeCategory(id);
        return "redirect:/category";
    }
    @RequestMapping("/editCategory/{id}")
    public String editcategory( @PathVariable("id") int id ,Model model){
        model.addAttribute("emptyCategory", categoryService.getCategoryById(id));
        model.addAttribute("listCategory", categoryService.categorysList());

        return "category";
    }
    @RequestMapping(value = "/categoryData/{id}" , method = RequestMethod.GET)
    public String categoryData(Model model, @PathVariable("id") int id){
        model.addAttribute("category", categoryService.getCategoryById(id));
        return "categoryData";
    }
}
