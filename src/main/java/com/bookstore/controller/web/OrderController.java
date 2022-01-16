package com.bookstore.controller.web;

import com.bookstore.constant.ViewCart;
import com.bookstore.repositories.InvoiceRepositories;
import com.bookstore.service.CartServices;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.InvoiceServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

@Controller
public class OrderController {

    @Autowired
    CategoriesServices categoriesServices;

    @Autowired
    InvoiceServices invoiceServices;

    @Autowired
    InvoiceRepositories invoiceRepositories;

    @Autowired
    CartServices cartServices;

    @GetMapping(value = {"/ordered"})
    public String ordered(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("category", categoriesServices.getAllCategory());

        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("idUser") == null) {

                Set<String> integerSet = (Set<String>) session.getAttribute("idInvoice");
                String listId = "";
                for (String list: integerSet) {
                    listId += list +", ";
                }
                String s = listId.substring(0, listId.length() - 2);
                System.out.println("id order:" + s);
                model.addAttribute("order", invoiceServices.getInvoiceByid(s, false));
                ViewCart.quantity(model, request);

            } else {
                Integer id = Integer.parseInt(session.getAttribute("idUser").toString());
                model.addAttribute("order", invoiceServices.getAllInvoiceByIdUser(id, false));
                ViewCart.quantity(model, request);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "order";
    }

    @GetMapping(value = {"/view-ordered/{id}"})
    public String viewOrdered(@PathVariable int id, Model model, final HttpServletRequest request, final HttpServletResponse response) {
        model.addAttribute("category", categoriesServices.getAllCategory());

        try {
            HttpSession session = request.getSession();
            model.addAttribute("cart", cartServices.findByIdOrder(id));
            ViewCart.quantity(model, request);

            if (session.getAttribute("idUser") == null) {
                if(session.getAttribute("idInvoice") != null){
                    Boolean statusDelete = invoiceRepositories.checkStatus_DeleteIdOrder(id);
                    Set<String> integers = (Set<String>) session.getAttribute("idInvoice");
                    Boolean contain = integers.contains(String.valueOf(id));
                    if (contain == false) {
                        return "redirect:/ordered";
                    }else {
                        if(statusDelete == true){
                            return "redirect:/ordered";
                        }else{
                            return "detail-order";
                        }
                    }
                }
                else{
                    return "redirect:/user/login";
                }

            } else {
                int idUser = Integer.parseInt(session.getAttribute("idUser").toString());
                boolean statusDelete = invoiceServices.checkIdOrder(idUser, id);
                if (statusDelete == true) {
                    return "redirect:/ordered";
                } else {
                    return "detail-order";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/ordered";
    }
    @DeleteMapping(value = {"/cancel-ordered/{id}"})
    public String cancelOrder(@PathVariable int id, Model model, final HttpServletRequest request,
                              final HttpServletResponse response) {

        invoiceServices.updateStatus(5, id);

        return "redirect:/ordered";
    }
    @DeleteMapping(value = {"/remove-ordered/{id}"})
    public String removeOrdered(@PathVariable int id, Model model, final HttpServletRequest request,
                                final HttpServletResponse response) {
        invoiceServices.updateStatusDelete(true, id);

        return "redirect:/ordered";
    }
}