package com.bookstore.controller.web;

import com.bookstore.constant.VNCharacterUtils;
import com.bookstore.entities.Invoice;
import com.bookstore.repositories.InvoiceRepositories;
import com.bookstore.service.*;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

@Controller
public class ZaloPay {
    @Autowired
    PayZalo payZalo;
    @Autowired
    InvoiceServices invoiceServices;
    @Autowired
    CategoriesServices categoriesServices;
    @Autowired
    InvoiceRepositories invoiceRepositories;
    @Autowired
    CartServices cartServices;

    @GetMapping("/createOrder")
    public String createOrder(Model model, final HttpServletRequest request, final HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            String idInvoice = session.getAttribute("idHoaDon").toString();
            Invoice invoice = invoiceServices.findById(Integer.parseInt(idInvoice));
            String name = VNCharacterUtils.removeAccent(invoice.getFullName());
            JSONObject result = payZalo.createOrder(idInvoice, name, invoice.getTotalMoney());

            if (session.getAttribute("idHoaDon") == null) {
                model.addAttribute("message", "Không có id hóa đơn");
                return "404";
            } else {

                invoiceServices.updateApptransidById(result.get("apptransid").toString(), idInvoice);
                model.addAttribute("category", categoriesServices.getAllCategory());
                model.addAttribute("order", cartServices.getCartByIdOrder(Integer.parseInt(idInvoice)));
                model.addAttribute("invoice", invoiceRepositories.getOne(Integer.parseInt(idInvoice)));
                session.removeAttribute("cart");
                if (session.getAttribute("idInvoice") == null) {
                    Set<String> integerSet = new HashSet<String>();
                    integerSet.add(idInvoice);
                    session.setAttribute("idInvoice", integerSet);

                } else {
                    Set<String> integerSet = (Set<String>) session.getAttribute("idInvoice");
                    integerSet.add(idInvoice);
                    session.setAttribute("idInvoice", integerSet);
                }
                model.addAttribute("orderURLZalo", result.get("orderurl"));
                model.addAttribute("apptransid", result.get("apptransid"));
            }

            return "redirect:"+ result.getString("orderurl");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "thanks";
    }
    @GetMapping("/ZaloPayOnl")
    public String thank(Model model, final HttpServletRequest request, final HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();

            if (session.getAttribute("idHoaDon") == null) {
                model.addAttribute("message", "Không có id hóa đơn");
                return "404";
            } else {
                Integer idInvoice = Integer.parseInt(session.getAttribute("idHoaDon").toString());
                session.removeAttribute("cart");
                //invoiceServices.updateStatus(1, idInvoice);
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
