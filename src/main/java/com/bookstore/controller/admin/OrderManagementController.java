package com.bookstore.controller.admin;

import com.bookstore.model.dto.AdminDto;
import com.bookstore.exception.AjaxResponse;
import com.bookstore.repositories.InvoiceRepositories;
import com.bookstore.service.*;
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
public class OrderManagementController {
    @Autowired
    ContactServices contactServices;
    @Autowired
    InvoiceServices invoiceServices;
    @Autowired
    InvoiceRepositories invoiceRepositories;
    @Autowired
    AdminServices adminServices;
    @Autowired
    ProductsServices productsServices;
    @Autowired
    CartServices cartServices;

    @GetMapping(value = {"/invoice"})
    public String dataListOrder(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {


        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("invoice", invoiceServices.findAll("0"));
        model.addAttribute("invoice2", invoiceServices.findAll("1,2"));
        model.addAttribute("invoice4", invoiceServices.findAll("4"));
        return "admin/OrdersManagement/data-list-order";

    }

    @GetMapping(value = {"/detail-invoice/{id}"})
    public String detalInvoice(@PathVariable Integer id, Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("invoice", invoiceServices.findById(id));
        model.addAttribute("order", cartServices.findByIdOrder(id));
        return "admin/OrdersManagement/detail-invoice";

    }

    @PostMapping(value = {"/invoice/{id}-{status}"})
    public ResponseEntity<AjaxResponse> updateHoaDon(@PathVariable int id, @PathVariable int status, Model model,
                                                     final HttpServletRequest request, final HttpServletResponse response) {

        invoiceServices.updateStatus(status, id);

        return ResponseEntity.ok(new AjaxResponse("", HttpStatus.OK));
    }

    @GetMapping(value = {"/remove-invoice/{id}"})
    public String removeHoaDon(@PathVariable int id, Model model, final HttpServletRequest request,
                               final HttpServletResponse response) {

        invoiceServices.deleteById(id);

        return "redirect:/admin/invoice";
    }

}
