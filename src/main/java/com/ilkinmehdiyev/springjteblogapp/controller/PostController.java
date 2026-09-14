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

@Controller
@RequestMapping("/posts")
public class PostController {

    private final PostRepo postRepo;

    public PostController(PostRepo postRepo) {
        this.postRepo = postRepo;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("posts", postRepo.findAll());
        return "pages/index";
    }

    @GetMapping("/new")
    public String newPost(Model model) {
        model.addAttribute("post", new Post());
        model.addAttribute("pageTitle", "New Post");
        model.addAttribute("action", "/posts");
        model.addAttribute("submitButtonText", "Create");
        return "pages/postNew";
    }

    @PostMapping
    public String createPost(@ModelAttribute Post post) {
        postRepo.save(post);
        return "redirect:/posts";
    }

    @GetMapping("/{id}")
    public String showPost(@PathVariable Long id, Model model) {
        model.addAttribute("post", findOrThrow(id));
        return "pages/post";
    }

    @GetMapping("/{id}/edit")
    public String editPost(@PathVariable Long id, Model model) {
        model.addAttribute("post", findOrThrow(id));
        model.addAttribute("pageTitle", "Edit Post");
        model.addAttribute("action", "/posts/" + id);
        model.addAttribute("submitButtonText", "Update");
        return "pages/postNew";
    }

    @PostMapping("/{id}")
    public String updatePost(@PathVariable Long id, @ModelAttribute Post post) {
        post.setId(id);
        postRepo.save(post);
        return "redirect:/posts";
    }

    @PostMapping("/{id}/delete")
    public String deletePost(@PathVariable Long id) {
        postRepo.delete(findOrThrow(id));
        return "redirect:/posts";
    }

    private Post findOrThrow(Long id) {
        return postRepo.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid post id: " + id));
    }
}
