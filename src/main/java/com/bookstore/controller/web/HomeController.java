package com.bookstore.controller.web;

import com.bookstore.constant.ViewCart;
import com.bookstore.entities.PhieuNhap;
import com.bookstore.entities.Products;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.service.AdminServices;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.ProductsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
public class HomeController {
    @Autowired
    CategoriesServices categoriesServices;

    @Autowired
    ProductsServices productsServices;
    @Autowired
    AdminServices adminServices;

    @GetMapping(value = {"/", "/home"})
    public String home(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("category", categoriesServices.findAll());
        ViewCart.getViewCart(model, request);

        model.addAttribute("product1", productsServices.findProductByCategoryIdAndLimit(1, 4));
        model.addAttribute("product2", productsServices.findProductByCategoryIdAndLimit(2, 4));
        model.addAttribute("product3", productsServices.findProductByCategoryIdAndLimit(4, 4));

        return "index";
    }

    @GetMapping(value = {"/404"})
    public String error(Model model, final HttpServletRequest request, final HttpServletResponse response) {
        model.addAttribute("category", categoriesServices.findAll());
        ViewCart.getViewCart(model, request);
        return "404";
    }

    @GetMapping(value = {"/gioi-thieu"})
    public String introduce(Model model, final HttpServletRequest request, final HttpServletResponse response) {
        model.addAttribute("category", categoriesServices.findAll());
        ViewCart.getViewCart(model, request);
        return "introduce";
    }
    //@ResponseStatus(HttpStatus.OK)
    // @ResponseBody
    @GetMapping("/test")
    public String index(final HttpServletRequest request,/* @CookieValue("id") int id,*/ Authentication authentication, final HttpServletResponse response) {
        /*Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            //if (cookies[i].getValue().equals(adminDto.getId())) {
               // cookies[i].setMaxAge(0);
               // response.addCookie(cookies[i]);
           // }
            System.out.println("cookies: " + cookies[i].getValue());
        }*/

        return "payOnline";
    }

}