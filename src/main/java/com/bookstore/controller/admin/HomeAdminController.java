package com.bookstore.controller.admin;

import com.bookstore.entities.Admin;
import com.bookstore.entities.Invoice;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.InvoiceRepositories;
import com.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/admin")
@Controller
public class HomeAdminController {
    @Autowired
    AdminServices adminServices;
    @Autowired
    ContactServices contactServices;
    @Autowired
    CategoriesServices categoriesServices;
    @Autowired
    ProductsServices productsServices;
    @Autowired
    CartServices cartServices;
    @Autowired
    UserServices userServices;
    @Autowired
    InvoiceServices invoiceServices;
    @Autowired
    InvoiceRepositories invoiceRepositories;
    @Value("${file.upload.path}")
    private String attachmentPath;

    @GetMapping("")
    public String indexAdmin(Model model, final HttpServletRequest request, final HttpServletResponse response, Authentication authentication) {

        try{
            Calendar calendar = Calendar.getInstance();
            AdminDto adminDto = adminServices.loadByUsername(authentication.getName());

            model.addAttribute("contactHeader", contactServices.findAll("0"));
            model.addAttribute("invoice", invoiceServices.getAllDESC(4));
            model.addAttribute("admin", adminDto);
            model.addAttribute("mapQuantity", productsServices.quantityCategoryProduct());

            model.addAttribute("totalRevenue", invoiceServices.sumTotalMoneyByMonth(calendar.get(Calendar.MONTH), calendar.get(Calendar.YEAR)));
            model.addAttribute("sellQuantity", cartServices.sumQuantity(calendar.get(Calendar.MONTH), calendar.get(Calendar.YEAR)));
            model.addAttribute("user_online", userServices.findAll("1").size());
            //model.addAttribute("orderDate", invoiceServices.selectInvoiceInDate(calendar.get(Calendar.DATE)));

        }catch (Exception e){
            e.printStackTrace();
        }

        return "admin/index";
    }

    // search order product
    @GetMapping("/order_product")
    public String getOrderProduct(@RequestParam(defaultValue = "") String idInvoice, Model model) {

        model.addAttribute("product", cartServices.getCartByIdOrder(Integer.parseInt(idInvoice)));
        model.addAttribute("idInvoice", idInvoice);

        return "admin/ajax/order_product";
    }
    @GetMapping(value = {"/admin-invoice/{id}-{status}"})
    public String updateInvoiceInHome(@PathVariable int id, @PathVariable int status, Model model,
                               final HttpServletRequest request, final HttpServletResponse response) {

        invoiceServices.updateStatus(status, id);

        return "redirect:/admin";
    }
}
