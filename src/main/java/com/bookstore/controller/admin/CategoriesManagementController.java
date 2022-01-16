package com.bookstore.controller.admin;

import com.bookstore.entities.Categories;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.CategoriesRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.ContactServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class CategoriesManagementController {
    @Autowired
    CategoriesServices categoriesServices;

    @Autowired
    CategoriesRepositories categoriesRepositories;

    @Autowired
    ContactServices contactServices;

    @Autowired
    AdminServices adminServices;

    @GetMapping("/data-table-category")
    public String dataTablesCategories(Model model,@CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("category", categoriesServices.findAll());
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("admin", adminDto);

        return "admin/CategoryManagement/data-list-category";
    }

    @GetMapping(value = {"/edit-category/{id}"})
    public String editCategory(@PathVariable int id,@CookieValue(value = "id", defaultValue = "") Integer idAdmin, final Model model, final HttpServletRequest request,
                               final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("category", categoriesServices.getCategoryById(id));
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("admin", adminDto);

        return "admin/CategoryManagement/edit-category";
    }

    @PostMapping(value = { "/edit_category" })
    public String updateCategory(@ModelAttribute("category") Categories category, final Model model,
                                            final HttpServletRequest request, final HttpServletResponse response) {

        categoriesRepositories.save(category);
        model.addAttribute("status", "success");

        return "redirect:/admin/data-table-category";
    }

    @GetMapping(value = {"/remove-category/{id}"})
    public String removeCategory(@PathVariable int id, Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {

        categoriesRepositories.deleteById(id);

        return "redirect:/admin/data-table-category";
    }
    @GetMapping(value = { "/add-category" })
    public String addCategory(final Model model,@CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        return "admin/CategoryManagement/add-category";
    }

    @PostMapping(value = {"/add_category"})
    public String addCategory(@ModelAttribute("category") Categories category, final Model model,
                      final HttpServletRequest request, final HttpServletResponse response) {

        categoriesRepositories.save(category);

        model.addAttribute("status", "success");

        return "redirect:/admin/data-table-category";
    }
/*
    @ResponseBody
    @GetMapping(value = {"/edit-categories/{id}"})
    public Map<String, Object> dataTablesCategories2(@PathVariable int id, Model model, final HttpServletRequest request,
                                                     final HttpServletResponse response) {

        Map<String, Object> map = new HashMap<>();
        map.put("category", categoriesServices.getCategoryById(id));
        map.put("contactHeader", contactServices.findAll(false));

        return map;
    }*/
}
