package com.bookstore.controller.web;

import com.bookstore.constant.ViewCart;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.PostServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class PostController {
    @Autowired
    PostServices postServices;
    @Autowired
    CategoriesServices categoriesServices;

    @GetMapping("/post")
    public String postIndex(Model model, final HttpServletRequest request, final HttpServletResponse response) {
        model.addAttribute("name", "post");
        model.addAttribute("category", categoriesServices.getAllCategory());
        model.addAttribute("post", postServices.getPost());
        model.addAttribute("postmost", postServices.getView());
        ViewCart.getViewCart(model, request);
        return "list-post";
    }

    @GetMapping("/post/{id}-{title}")
    public String getPost(@PathVariable int id, Model model, final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("category", categoriesServices.getAllCategory());
        model.addAttribute("post", postServices.getPostById(id));
        ViewCart.getViewCart(model, request);
        return "postIndex";
    }
}