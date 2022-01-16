package com.bookstore.controller.admin;

import com.bookstore.entities.Supplier;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.SupplierRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.ContactServices;
import com.bookstore.service.SupplierServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class SuppilerManagementController {

    @Autowired
    ContactServices contactServices;
    @Autowired
    SupplierServices supplierServices;
    @Autowired
    SupplierRepositories supplierRepositories;
    @Autowired
    AdminServices adminServices;

    @GetMapping(value = {"/data-table-supplier"})
    public String dataTableSupplier(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("nhacc", supplierServices.getAllSupplier());
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/SupplierManagement/data-list-supplier";
    }

    @PostMapping(value = {"/remove-supplier/{id}"})
    public String removeSupplier(@PathVariable int id, Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {

        supplierRepositories.deleteById(id);

        return "redirect:/admin/data-table-supplier";
    }

    @GetMapping(value = {"/edit-supplier/{id}"})
    public String editSupplier(@PathVariable int id, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, Model model, final HttpServletRequest request,
                               final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        Supplier ncc = supplierRepositories.getOne(id);
        model.addAttribute("nhacc", ncc);
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/SupplierManagement/edit-supplier";
    }

    @PostMapping(value = {"/edit-supplier"})
    public String saveSupplier(@ModelAttribute("nhacc") Supplier ncc, Model model, final HttpServletRequest request,
                               final HttpServletResponse response) {

        supplierRepositories.save(ncc);

        return "redirect:/admin/data-table-supplier";
    }

    @GetMapping(value = {"/add-supplier"})
    public String supplier(Model model, final HttpServletRequest request, @CookieValue(value = "id", defaultValue = "") Integer idAdmin,
                           final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/SupplierManagement/add-supplier";
    }

    @PostMapping(value = {"/add-supplier"})
    public String addSupplier(@ModelAttribute("nhacc") Supplier ncc, Model model, final HttpServletRequest request,
                              final HttpServletResponse response) {

        supplierRepositories.save(ncc);

        return "redirect:/admin/data-table-supplier";
    }
}
