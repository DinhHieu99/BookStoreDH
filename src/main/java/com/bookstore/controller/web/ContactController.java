package com.bookstore.controller.web;

import com.bookstore.constant.ViewCart;
import com.bookstore.entities.Contact;
import com.bookstore.exception.AjaxResponse;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.ContactServices;
import com.bookstore.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;


@Controller
public class ContactController {
    @Autowired
    CategoriesServices categoriesServices;

    @Autowired
    ContactServices contactServices;

    @Autowired
    UserServices userServices;

    @Autowired
    ContactRepositories contactRepositories;

    @GetMapping("/contact")
    public String contact(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        try{
            HttpSession session = request.getSession();
            int id = Integer.parseInt(session.getAttribute("idUser").toString());
            model.addAttribute("user", userServices.findById(id));
            model.addAttribute("category", categoriesServices.getAllCategory());
            ViewCart.getViewCart(model, request);
        }catch (Exception e){
            e.printStackTrace();
        }

        return "contact";
    }

    @PostMapping(value = "/sendMail", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<AjaxResponse> saveContact(@RequestBody final Map<String, Object> data, Model model, final HttpServletRequest request,
                                                    final HttpServletResponse response) {

        Date date = new Date();
        Contact contact = new Contact();
        contact.setStatus(0);
        contact.setCreatedDate(date);
        contact.setContent(String.valueOf(data.get("content")));
        contact.setEmail(String.valueOf(data.get("email")));
        contact.setFullName(String.valueOf(data.get("fullName")));
        contact.setSubject(String.valueOf(data.get("subject")));
        if(String.valueOf(data.get("avatar")) == null || String.valueOf(data.get("avatar")).equals("") == true){
            contact.setAvatar("avatar.png");
        }else{
            contact.setAvatar(String.valueOf(data.get("avatar")));
        }

        contactRepositories.save(contact);

        return ResponseEntity.ok(new AjaxResponse("", HttpStatus.OK));
    }
}