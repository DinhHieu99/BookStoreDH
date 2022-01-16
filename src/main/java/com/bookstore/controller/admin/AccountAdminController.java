package com.bookstore.controller.admin;

import com.bookstore.entities.Admin;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.ContactServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class AccountAdminController {
    @Autowired
    AdminServices adminServices;
    @Autowired
    AdminRepositories adminRepositories;
    @Autowired
    ContactServices contactServices;
    @Value("${file.upload.path}")
    private String attachmentPath;

    @RequestMapping(value = {"/Admin/login"})
    public String dataTableSupplier(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        return "admin/login";
    }

    @GetMapping("/register")
    public String register(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        return "admin/register";
    }

    @PostMapping("/register")
    public String saveRegister(@ModelAttribute("register") Admin admin, Model model, final HttpServletRequest request,
                               final HttpServletResponse response) {

        admin.setStatus(false);
        admin.setStatus_login(true);
        if (admin.getPassword().toString().equals(admin.getConfimPassword())) {
            admin.setImg("avatar.png");
            if (adminServices.insertAdmin(admin, admin.getUsername()) == true) {
                model.addAttribute("mesage", "success");
                return "redirect:/admin";
            } else {
                model.addAttribute("mesage", "false");
                return "redirect:/register";
            }
        } else {
            model.addAttribute("mesage", "false");
        }
        return "admin/register";
    }

    @GetMapping(value = {"/admin/account_information"})
    public String influencer_profile(Model model, final HttpServletRequest request,@CookieValue(value = "id", defaultValue = "") Integer idAdmin,
                                     final HttpServletResponse response) {

        model.addAttribute("contactHeader", contactServices.findAll("0"));

        AdminDto admin = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", admin);

        /*try {
            String message = request.getParameter("message");
            if (message.equals("false")) {
                model.addAttribute("alert", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }*/

        return "admin/account_information";
    }

    @PostMapping(value = {"/admin/edit_account_information"})
    public String EditProfile(@RequestParam("image") MultipartFile avatar, @ModelAttribute("admin") Admin admin,
                              Model model, final HttpServletRequest request, final HttpServletResponse response)
            throws IllegalStateException, IOException {

        model.addAttribute("contactHeader", contactServices.findAll("0"));
        AdminDto adminDto = adminServices.getEmployeeById(admin.getId());
        model.addAttribute("admin", admin);
        try {
            HttpSession session = request.getSession();
            if (avatar != null && avatar.getSize() > 0) {
                avatar.transferTo(new File(attachmentPath + "/" + avatar.getOriginalFilename()));
                admin.setImg(avatar.getOriginalFilename());

            } else {
                admin.setImg(adminDto.getAvatar());
            }

            if(admin.getPassword() == null){
                admin.setPassword(adminDto.getPassword());
                adminServices.updateAdmin(admin, admin.getId());
            }
            else{
                if(admin.getPasswordNew().equals(admin.getConfimPassword()) == true &&
                        (admin.getPasswordNew() != null || admin.getConfimPassword() != null)){
                    System.out.println("đã lưu pass word ms");
                    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
                    admin.setPassword(encoder.encode(admin.getPasswordNew()));
                    adminServices.updateAdmin(admin, admin.getId());
                    model.addAttribute("message", "success");
                }else{

                    model.addAttribute("message", "false");
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/admin/account_information";
    }
}
