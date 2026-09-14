package com.ilkinmehdiyev.springjteblogapp.controller;

import com.ilkinmehdiyev.springjteblogapp.PostRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final PostRepo postRepo;

    public HomeController(PostRepo postRepo) {
        this.postRepo = postRepo;
    }

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("postCount", postRepo.count());
        return "pages/home";
    }
}
