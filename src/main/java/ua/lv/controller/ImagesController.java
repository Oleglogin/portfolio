package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Images;
import ua.lv.service.ImagesService;

@Controller
public class ImagesController {
    @Autowired
    ImagesService imagesService;

    @GetMapping("/images")
    public String images(Model model){
        model.addAttribute("emptyImages", new  Images());
        model.addAttribute("imageList", imagesService.imagesList()) ;
        return "/images";
    }
    @RequestMapping(value = "/images/add", method = RequestMethod.POST)
    public String addImages(@ModelAttribute("emptyImages")Images images){
        imagesService.addImages(images);
        return "redirect:/images";
    }
    @RequestMapping(value = "/removeImages/{id}")
    public String deleteImages(@PathVariable("id") int id){
        imagesService.removeImages(id);
        return "redirect:/images";
    }
    @RequestMapping(value = "/editImages/{id}")
    public String editImages(@PathVariable("id") int id,Model model){
        model.addAttribute("imageList", imagesService.imagesList());
        model.addAttribute("emptyImages",imagesService.getImagesById(id));
        return "images";
    }

    @RequestMapping(value = "imageData/{id}", method = RequestMethod.GET)
    public String imageData(@PathVariable("id") int id, Model model){
        model.addAttribute("image", imagesService.getImagesById(id));
        return "imageData";
    }

}
