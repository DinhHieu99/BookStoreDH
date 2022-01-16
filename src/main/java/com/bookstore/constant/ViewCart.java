package com.bookstore.constant;

import com.bookstore.entities.Cart;
import com.bookstore.model.dto.CartDto;
import com.bookstore.service.CategoriesServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class ViewCart {

    public static void getViewCart(Model model, final HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            List<CartDto> carts = (List<CartDto>) session.getAttribute("cart");
            model.addAttribute("soLuongHang", carts.size());
            model.addAttribute("ThanhTien", IsExisting.totalMoney(carts));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void removeProductView(int id, Model model, final HttpServletRequest request){
        HttpSession session = request.getSession();
        List<CartDto> cart = (List<CartDto>) session.getAttribute("cart");
        int index = IsExisting.isExisting(id, cart);
        cart.remove(index);
        session.setAttribute("cart", cart);

        if (cart.size() == 0)
            session.removeAttribute("cart");
    }

    public static void quantity(Model model, final HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            List<CartDto> carts = (List<CartDto>) session.getAttribute("cart");
            int totalMoney = (int) IsExisting.totalMoney(carts);
            model.addAttribute("ThanhTien", totalMoney);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
