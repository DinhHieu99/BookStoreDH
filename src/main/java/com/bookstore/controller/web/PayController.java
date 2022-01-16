package com.bookstore.controller.web;

import com.bookstore.constant.IsExisting;
import com.bookstore.constant.ViewCart;
import com.bookstore.entities.Invoice;
import com.bookstore.model.dto.CartDto;
import com.bookstore.model.dto.UserDto;
import com.bookstore.repositories.InvoiceRepositories;
import com.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class PayController {
    @Autowired
    UserServices userServices;

    @Autowired
    CartServices cartServices;

    @Autowired
    ProductsServices productsServices;

    @Autowired
    InvoiceServices invoiceServices;

    @Autowired
    InvoiceRepositories invoiceRepositories;

    @Autowired
    CategoriesServices categoriesServices;

    @GetMapping("/pay")
    public String pay(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("category", categoriesServices.getAllCategory());
        ViewCart.getViewCart(model, request);
        HttpSession session = request.getSession();
        try {
            List<CartDto> carts = (List<CartDto>) session.getAttribute("cart");
            int quantity = carts.size();
            model.addAttribute("soLuongHang", quantity);
            int totalMoney = (int) IsExisting.totalMoney(carts);
            model.addAttribute("ThanhTien", totalMoney);
            int id = Integer.parseInt(session.getAttribute("idUser").toString());
            UserDto user = userServices.findById(id);
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "pay";
    }

    @PostMapping("/pay/addPay")
    public String savePay(@ModelAttribute("invoice") Invoice hd, Model model, final HttpServletRequest request,
                          final HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            List<CartDto> cart = (List<CartDto>) session.getAttribute("cart");
            Date date = new Date();

            hd.setStatus(0);
            hd.setCreated(date);
            hd.setStatusDelete(false);

            if (hd.getUser().getId() != null) {
                invoiceRepositories.save(hd);
                session.setAttribute("idHoaDon", hd.getId());
                cartServices.insertCart(cart, 0, hd.getId());

            } else {
                hd.setUser(null);
                invoiceRepositories.save(hd);
                session.setAttribute("idHoaDon", hd.getId());
                System.out.println("idHoadon: " + session.getAttribute("idHoaDon"));
                cartServices.insertCart(cart, 0, hd.getId());
            }

            if(hd.getPay() == true){
                return "redirect:/createOrder";
            }else{
                return "redirect:/thanks";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String thank(Model model, final HttpServletRequest request, final HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();

            if (session.getAttribute("idHoaDon") == null) {
                model.addAttribute("message", "Không có id hóa đơn");
                return "404";
            } else {
                Integer idInvoice = Integer.parseInt(session.getAttribute("idHoaDon").toString());
                session.removeAttribute("cart");

                model.addAttribute("order", cartServices.getCartByIdOrder(idInvoice));
                model.addAttribute("invoice", invoiceRepositories.getOne(idInvoice));
                model.addAttribute("category", categoriesServices.getAllCategory());

                if (session.getAttribute("idInvoice") == null) {
                    Set<String> integerSet = new HashSet<String>();
                    integerSet.add(String.valueOf(idInvoice));
                    session.setAttribute("idInvoice", integerSet);

                } else {
                    Set<String> integerSet = (Set<String>) session.getAttribute("idInvoice");
                    integerSet.add(String.valueOf(idInvoice));
                    session.setAttribute("idInvoice", integerSet);
                }
            }
            return "thanks";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "thanks";
    }


}