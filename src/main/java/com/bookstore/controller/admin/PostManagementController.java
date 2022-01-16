package com.bookstore.controller.admin;

import com.bookstore.entities.Admin;
import com.bookstore.entities.Post;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.repositories.PostRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.ContactServices;
import com.bookstore.service.PostServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class PostManagementController {
    @Autowired
    PostServices postServices;

    @Autowired
    PostRepositories postRepositories;
    @Autowired
    AdminServices adminServices;
    @Autowired
    AdminRepositories adminRepositories;
    @Autowired
    ContactServices contactServices;

    @Value("${file.upload.path}")
    private String attachmentPath;

    @GetMapping(value = {"/post"})
    public String listPost(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("post", postServices.findAll());
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/PostManagement/data-list-post";
    }

    @GetMapping(value = {"/add-post"})
    public String addPost(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/PostManagement/add-post";
    }

    @PostMapping(value = "/addPost")
    public String savePost(@RequestParam("postImage") MultipartFile postImage, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, @ModelAttribute("post") Post post,
                           final Model model, final HttpServletRequest request, final HttpServletResponse response)
            throws IllegalStateException, IOException {

        if (postImage != null && postImage.getSize() > 0) {

            post.setImage(postImage.getOriginalFilename());

            // lưu file vào folder trên server.
            // E:/web-tintuc/Nhom13-web/src/main/resources/META-INF/img/upload/abc.jpeg

            postImage.transferTo(new File(attachmentPath + "/" + postImage.getOriginalFilename()));
        }

        Date now = new Date();
        Date createdDate = new Date(now.getTime());
        post.setCreatedDate(createdDate);

        Admin admin = adminRepositories.getOne(idAdmin);
        post.setAdmin(admin);

        postRepositories.save(post);

        return "redirect:/admin/add-post";
    }

    @GetMapping(value = {"/edit-post/id={id}"})
    public String editPost(@PathVariable int id, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, Model model, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        Post post = postRepositories.getOne(id);
        model.addAttribute("post", postServices.getPostById(id));
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/PostManagement/edit-post";
    }

    @PostMapping(value = {"/edit-post"})
    public String savePostViaBindData(@RequestParam("postImage") MultipartFile postImage, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, @ModelAttribute("post") Post post, final Model model, final HttpServletRequest request,
                                      final HttpServletResponse response) throws IllegalStateException, IOException {

        if (postImage != null && postImage.getSize() > 0) {

            post.setImage(postImage.getOriginalFilename());

            // lưu file vào folder trên server.
            // E:/web-tintuc/Nhom13-web/src/main/resources/META-INF/img/upload/abc.jpeg

            postImage.transferTo(new File(attachmentPath + "/" + postImage.getOriginalFilename()));
        }
        Date now = new Date();
        Date createdDate = new Date(now.getTime());
        post.setCreatedDate(createdDate);

        Admin admin = adminRepositories.getOne(idAdmin);
        post.setAdmin(admin);
        postRepositories.save(post);

        // trả về tên view.
        return "redirect:/admin/post";
    }

    @GetMapping(value = {"/remove-post/{id}"})
    public String removePost(@PathVariable int id, Model model, final HttpServletRequest request, final HttpServletResponse response) {

        postRepositories.deleteById(id);

        return "redirect:/admin/post";
    }
}
