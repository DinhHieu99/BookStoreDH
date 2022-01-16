package com.bookstore.controller.web;

import com.bookstore.constant.IsExisting;
import com.bookstore.constant.ViewCart;
import com.bookstore.exception.AjaxResponse;
import com.bookstore.model.dto.CartDto;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.ProductsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    ProductsServices productsServices;
    @Autowired
    CategoriesServices categoriesServices;

    @GetMapping("/cart")
    public String cart(Model model, final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("category", categoriesServices.getAllCategory());
        model.addAttribute("name", "cart");

        ViewCart.getViewCart(model, request);

        return "cart";
    }

    @PostMapping(value = {"/addCart-{id}"})
    public ResponseEntity<AjaxResponse> addCart(@PathVariable int id, Model model, final HttpServletRequest request, final HttpServletResponse response) {

        HttpSession session = request.getSession();
        ProductDto product = productsServices.findProductById(id);

        if (session.getAttribute("cart") == null) {
            List<CartDto> carts = new ArrayList<CartDto>();

            carts.add(new CartDto(id, product.getName(), product.getImgProduct(), 1, product.getDiscount(), 1 * product.getDiscount()));
            session.setAttribute("cart", carts);

        } else {
            List<CartDto> carts = (List<CartDto>) session.getAttribute("cart");
            int index = IsExisting.isExisting(id, carts);

            if (index == -1) {
                carts.add(new CartDto(id, product.getName(), product.getImgProduct(), 1, product.getDiscount(), 1 * product.getDiscount()));
            } else {
                int quantity = carts.get(index).getQuantity() + 1;
                carts.get(index).setQuantity(quantity);
                carts.get(index).setMoney(quantity * product.getDiscount());
            }
            session.setAttribute("cart", carts);
        }
        return ResponseEntity.ok(new AjaxResponse("", 200));
    }

    @PostMapping("/editProduct-{id}")
    public String editCart(@PathVariable int id, @ModelAttribute("cart") CartDto cart, Model model,
                           final HttpServletRequest request, final HttpServletResponse response) {

        HttpSession session = request.getSession();
        List<CartDto> carts = (List<CartDto>) session.getAttribute("cart");

        int index = IsExisting.isExisting(id, carts);

        ProductDto product = productsServices.findProductById(id);

        cart.setName(product.getName());
        cart.setImg(product.getImgProduct());
        cart.setDiscount(product.getDiscount());
        cart.setMoney(cart.getDiscount() * cart.getQuantity());
        carts.set(index, cart);

        for (int i = 0; i < carts.size(); i++) {
            System.out.println(carts.get(i).getId());
        }

        session.setAttribute("cart", carts);

        return "redirect:/cart";
    }

    @DeleteMapping(value = {"/removeCart-{id}"})
    public ResponseEntity<AjaxResponse> deleteTopCart(@PathVariable Integer id, Model model, final HttpServletRequest request,
                                                      final HttpServletResponse response) {

        ViewCart.removeProductView(id, model, request);

        return ResponseEntity.ok(new AjaxResponse("", 200));
    }

}