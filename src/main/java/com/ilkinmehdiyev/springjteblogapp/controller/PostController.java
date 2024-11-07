package com.ilkinmehdiyev.springjteblogapp.controller;

import com.ilkinmehdiyev.springjteblogapp.Post;
import com.ilkinmehdiyev.springjteblogapp.PostRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/posts")
public record PostController(PostRepo postRepo) {

//    @GetMapping("/")
//    String index(Model model) {
//        model.addAttribute("title", "Spring J Teblog App");
//        model.addAttribute("username", "Jonald D Prompt ");
//        return "pages/index";
//    }

    @GetMapping
    public String listpages(Model model) {
        model.addAttribute("posts", postRepo.findAll());
        return "pages/index";
    }

    @GetMapping("/new")
    public String newPost(Model model) {
        model.addAttribute("post", new Post());
        return "pages/postNew";
    }

    @PostMapping
    public String createPost(@ModelAttribute Post post) {
        postRepo.save(post);
        return "redirect:/posts";
    }

    @GetMapping("/{id}")
    public String showPost(@PathVariable Long id, Model model) {
        Post post = postRepo.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid post Id:" + id));
        model.addAttribute("post", post);
        return "post";
    }

    @GetMapping("/{id}/edit")
    public String editPost(@PathVariable Long id, Model model) {
        Post post = postRepo.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid post Id:" + id));
        model.addAttribute("post", post);
        return "pages/edit";
    }

    @PostMapping("/{id}")
    public String updatePost(@PathVariable Long id, @ModelAttribute Post post) {
        postRepo.save(post);
        return "redirect:/posts";
    }

    @PostMapping("/{id}/delete")
    public String deletePost(@PathVariable Long id) {
        Post post = postRepo.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid post Id:" + id));
        postRepo.delete(post);
        return "redirect:/posts";
    }
}
