package com.bookstore.controller.admin;

import com.bookstore.model.dto.AdminDto;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class WarehouseManagementController {

    @Autowired
    ProductsServices productsServices;

    @Autowired
    ContactServices contactServices;

    @Autowired
    AdminServices adminServices;

    @GetMapping(value = { "/data-table-warehouse" })
    public String dataTablesWarehouse(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        System.out.println("----------------------------- WARE HOUSE --------------------------------");
        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("products", productsServices.findAllProductsByQuantity());

        return "admin/WarehouseManagement/data-list-warehouse";
    }

}
