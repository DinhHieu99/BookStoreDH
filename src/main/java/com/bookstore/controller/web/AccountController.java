package com.bookstore.controller.web;

import com.bookstore.constant.ViewCart;
import com.bookstore.entities.User;
import com.bookstore.model.dto.UserDto;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.UserServices;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class AccountController {

    @Autowired
    UserServices userServices;
    @Autowired
    UserRepositories userRepositories;
    @Autowired
    CategoriesServices categoriesServices;
    @Value("${file.upload.path}")
    private String attachmentPath;

    @GetMapping("/user/login")
    public String login(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("name", "login");
        model.addAttribute("category", categoriesServices.getAllCategory());
        ViewCart.getViewCart(model, request);
        return "login";
    }

    @PostMapping("/user/login")
    public String activeLogIn(@ModelAttribute("Login") User user, ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response) {
        System.out.println("email : " + user.getEmail());
        System.out.println("Password : " + user.getPassword());
        String email = user.getEmail();
        String pass = user.getPassword();
        List<User> users = userRepositories.findAll();

        for (User tk : users) {
            if (user.getEmail().equals(tk.getEmail())) {
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
                boolean valuate = encoder.matches(user.getPassword(), tk.getPassword());
                System.out.println("return password:" + valuate);
                if (valuate == true && tk.getStatus() != 3) {

                    userServices.updateStatus(1, tk.getId());

                    HttpSession session = request.getSession(false);

                    if(session != null){
                        session.setAttribute("nameUser", tk.getName().toString());
                        session.setAttribute("emailUser", tk.getEmail().toString());
                        session.setAttribute("idUser", tk.getId().toString());
                    }

                    /*Cookie cookie = new Cookie("idUser", tk.getId().toString());
                    cookie.setMaxAge(60 * 60);
                    cookie.setSecure(true);
                    cookie.setHttpOnly(true);
                    response.addCookie(cookie);*/

                    return "redirect:/";
                }
                return "redirect:/user/login";
            }
        }
        return "redirect:/user/login";
    }

    @GetMapping("/account/register")
    public String register(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("name", "register");
        model.addAttribute("category", categoriesServices.getAllCategory());
        ViewCart.getViewCart(model, request);

        return "register";
    }

    @PostMapping("/user/register")
    public String saveAccount(@ModelAttribute("register") User user, Model model,
                              final HttpServletRequest request, final HttpServletResponse response)
            throws IllegalStateException, IOException {

        user.setStatus(0);
        Calendar calendar = Calendar.getInstance();
        user.setCreated(calendar.getTime());

        if (user.getPassword().toString().equals(user.getConfimPassword())) {

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
            user.setPassword(encoder.encode(user.getPassword()));
            user.setAvatar("avatar.png");

            if (userServices.insertUser(user) == true) {
                return "redirect:/account/register";
            }
        }
        return "redirect:/account/register";
    }

    @GetMapping("/account_information/user{id}")
    public String accountInformation(@PathVariable int id, Model model, final HttpServletRequest request,
                                     final HttpServletResponse response) {

        try {
            HttpSession session = request.getSession();
            if (id != Integer.parseInt(session.getAttribute("idUser").toString()) || session.getAttribute("idUser").toString() == null) {
                return "redirect:/";
            } else {
                model.addAttribute("name", "register");
                model.addAttribute("category", categoriesServices.getAllCategory());
                model.addAttribute("account", userServices.findById(id));
                ViewCart.getViewCart(model, request);

                String message = request.getParameter("message");

                if (message != null) {
                    if (message.equals("success")) {
                        model.addAttribute("alert", "success");
                        model.addAttribute("messageAlert", "Sửa thông tin thành công.");
                    } else if (message.equals("false")) {
                        model.addAttribute("alert", "danger");
                        model.addAttribute("messageAlert", "Sửa thông tin không thành công thành công.");
                    } else {

                    }
                }
                return "account_information";
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    /* @RequestBody - Spring sẽ tự động ánh xạ dữ liệu JSON trong  HttpRequest body sang một Java Type object tương ứng.*/
    /*@ResponseBody
    //được dùng để thông báo với controller rằng Java Object trả về cho client sẽ tự động ánh xạ sang JSON và chuyển vào HttpResponse.
    @GetMapping("/account_information/user-{id}")
    public UserDto accountInformation2(@PathVariable int id, Model model, final HttpServletRequest request,
                                       final HttpServletResponse response) {

        UserDto user = userServices.findById(id);
        return user;
    }*/

    @PostMapping(value = {"/edit_account_information"})
    public String editAccountInformation(@RequestParam("image") MultipartFile userAvatar,
                                         @ModelAttribute("user") User user, Model model, final HttpServletRequest request,
                                         final HttpServletResponse response) throws IllegalStateException, IOException {


        Date date = new Date();

        Integer idUser = user.getId();
        UserDto userDto = userServices.findById(idUser);
        String password = userServices.findPasswordById(idUser);

        if (userAvatar != null && userAvatar.getSize() > 0) {
            // lưu file vào folder trên server.
            userAvatar.transferTo(new File(attachmentPath + "/" + userAvatar.getOriginalFilename()));
            user.setAvatar(userAvatar.getOriginalFilename());
        }
        else{
            user.setAvatar(userDto.getAvatar());
        }

        user.setUser_status(userDto.getUser_status());
        user.setCreated(date);
        user.setStatus(0);

        if(user.getPassword() == null){
            user.setPassword(password);
            userServices.updateUser(user, idUser);
        }
        else{
            if(user.getPasswordNew().equals(user.getConfimPassword()) == true &&
                    (user.getPasswordNew() != null || user.getConfimPassword() != null)){
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
                user.setPassword(encoder.encode(user.getPasswordNew()));
                userServices.updateUser(user, idUser);
                model.addAttribute("message", "success");
            }else{

                model.addAttribute("message", "false");
            }
        }

        return "redirect:/account_information/user" + idUser;
    }


    @GetMapping("/user/logout")
    public String logout(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(session.getAttribute("idUser").toString());
            userServices.updateStatus(0, id);
            session.removeAttribute("nameUser");
            session.removeAttribute("idUser");
            session.removeAttribute("emailUser");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
}