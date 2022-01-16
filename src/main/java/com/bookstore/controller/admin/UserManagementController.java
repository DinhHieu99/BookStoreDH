package com.bookstore.controller.admin;

import com.bookstore.entities.User;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.exception.AjaxResponse;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.ContactServices;
import com.bookstore.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class UserManagementController {

    @Autowired
    ContactServices contactServices;

    @Autowired
    UserServices userServices;

    @Autowired
    UserRepositories userRepositories;

    @Autowired
    AdminServices adminServices;

    @GetMapping(value = { "/data-table-user" })
    public String dataTableUsers(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("users", userServices.findAll("0, 1"));
        model.addAttribute("users_delete", userServices.findAll("3"));
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/UsersManagement/data-list-user";
    }

    @DeleteMapping(value = { "/remove-users/{id}" })
    public ResponseEntity<AjaxResponse> removeUser(@PathVariable int id, Model model, final HttpServletRequest request,
                                                   final HttpServletResponse response) {

        userServices.updateStatus(3,id);

        return ResponseEntity.ok(new AjaxResponse("", HttpStatus.OK));
    }
    @PutMapping(value = { "/status_recovery/{id}" })
    public ResponseEntity<AjaxResponse> editUser(@PathVariable int id, Model model, final HttpServletRequest request,
                                                   final HttpServletResponse response) {

        userServices.updateStatus(0,id);

        return ResponseEntity.ok(new AjaxResponse("", HttpStatus.OK));
    }
    @GetMapping(value = { "/edit-users/{id}" })
    public String editUser(@PathVariable int id, Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request,
                           final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("users", userRepositories.findById(id));
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/UsersManagement/edit-user";
    }

    @PostMapping(value = { "/edit-users" })
    public String saveUser(@ModelAttribute("users") User user, Model model, final HttpServletRequest request,
                           final HttpServletResponse response) {

        User pass= userRepositories.getOne(user.getId());
        user.setPassword(pass.getPassword());
        userServices.updateUser(user, user.getId());

        return "redirect:/admin/data-table-user";
    }
}
