package com.bookstore.controller.admin;

import com.bookstore.entities.Admin;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.exception.AjaxResponse;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.ContactServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class EmployeeManagementController {
    @Value("${file.upload.path}")
    private String attachmentPath;

    @Autowired
    AdminServices adminServices;

    @Autowired
    AdminRepositories adminRepositories;

    @Autowired
    ContactServices contactServices;

    @GetMapping( "/data-table-employee")
    public String dataAdmin(Model model,@CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        System.out.println("role: " + adminDto.getRole());
        if(adminDto.getRole().equals("ADMIN") == true){
            model.addAttribute("admin", adminDto);
            model.addAttribute("contactHeader", contactServices.findAll("0"));
            model.addAttribute("employee", adminServices.findAll());

            return "admin/EmployeeManagement/data-list-employee";
        }else{
            return "redirect:/404";
        }
    }

    @DeleteMapping(value = { "/remove-admin/{id}" })
    public ResponseEntity<AjaxResponse> removeAdmin(@PathVariable int id, Model model, final HttpServletRequest request,
                                                    final HttpServletResponse response) {

        if (adminRepositories.countAdmin() > 1) {
            adminRepositories.deleteById(id);
        }

        return ResponseEntity.ok(new AjaxResponse("", 200));
    }

    @GetMapping(value = { "/edit-admin/{id}" })
    public String editAdmin(@PathVariable int id, Model model,@CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request,
                            final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("employee", adminServices.getEmployeeById(id));

        return "/admin/EmployeeManagement/edit-employee";
    }

    @PostMapping(value = { "/edit-admin" })
    public String editAdmin(@ModelAttribute("admin") Admin admin, Model model, final HttpServletRequest request,
                            final HttpServletResponse response) {

        Admin tk = adminRepositories.getOne(admin.getId());
        admin.setImg(tk.getImg());
        admin.setUsername(tk.getUsername());
        admin.setPassword(tk.getPassword());

        System.out.println("role: " + admin.getStatus_login());
        //adminServices.updateAdminRole(admin.getId(), admin.getAdminRoles());
        adminRepositories.save(admin);

        return "redirect:/admin/data-table-employee";
    }

}
