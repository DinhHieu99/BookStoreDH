package com.bookstore.controller.web;

import com.bookstore.constant.IsExisting;
import com.bookstore.constant.VNCharacterUtils;
import com.bookstore.constant.ViewCart;
import com.bookstore.entities.Products;
import com.bookstore.entities.ReviewProduct;
import com.bookstore.entities.User;
import com.bookstore.exception.AjaxResponse;
import com.bookstore.model.dto.CartDto;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.repositories.ReviewProductRepositories;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class ProductController {
    @Autowired
    ProductsServices productsServices;
    @Autowired
    ProductsRepositories productsRepositories;
    @Autowired
    CategoriesServices categoriesServices;
    @Autowired
    SupplierServices supplierServices;
    @Autowired
    ReviewProductServices reviewProductServices;
    @Autowired
    ReviewProductRepositories reviewProductRepositories;
    @Autowired
    UserServices userServices;
    @Autowired
    UserRepositories userRepositories;

    @GetMapping(value = "/product/{id}/{name}")
    public String product(@PathVariable Integer id, Model model, final HttpServletRequest request, final HttpServletResponse response) {

        System.out.println("========================================== Show product =================================");

        model.addAttribute("product", productsServices.findProductById(id));
        model.addAttribute("category", categoriesServices.getAllCategory());
        model.addAttribute("rating", reviewProductServices.findAllByIdProduct(id));
        model.addAttribute("countComment", reviewProductServices.countComment(id));
        model.addAttribute("mostView", productsServices.mostView());
        int view = productsServices.findProductById(id).getView();
        view++;
        Calendar calendar = Calendar.getInstance();

        productsRepositories.updateView(view, id);

        try {
            int count = reviewProductRepositories.countComment(id);
            int sumRating= reviewProductRepositories.sumRating(id);

            model.addAttribute("avgStar", sumRating/count);

            HttpSession session = request.getSession();
            if (session.getAttribute("idUser").toString() == null) {
                model.addAttribute("idUser", null);
                System.out.println("id user:" + session.getAttribute("idUser"));
            } else {
                model.addAttribute("idUser", session.getAttribute("idUser").toString());
                System.out.println("id user:" + session.getAttribute("idUser"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        ViewCart.getViewCart(model, request);

        return "product";
    }

    @PostMapping(value = {"/addProduct"})
    public String addProduct(@ModelAttribute("product") Products product, Model model,
                             final HttpServletRequest request, final HttpServletResponse response) {
        int id = product.getId();

        HttpSession session = request.getSession();
        ProductDto products = productsServices.findProductById(id);
        String name = VNCharacterUtils.removeAccent(products.getName());
        if (session.getAttribute("cart") == null) {
            List<CartDto> carts = new ArrayList<CartDto>();
            carts.add(new CartDto(id, products.getName(), products.getImgProduct(), product.getQuantity(), products.getDiscount(),
                    product.getQuantity() * products.getDiscount()));
            session.setAttribute("cart", carts);
        } else {
            List<CartDto> carts = (List<CartDto>) session.getAttribute("cart");
            int index = IsExisting.isExisting(id, carts);

            if (index == -1) {
                carts.add(new CartDto(id, products.getName(), products.getImgProduct(), product.getQuantity(), products.getDiscount(),
                        product.getQuantity() * products.getDiscount()));
                System.out.println("cart:" + carts);
            } else {
                int quantity = carts.get(index).getQuantity() + product.getQuantity();
                carts.get(index).setQuantity(quantity);
                carts.get(index).setMoney(quantity * product.getDiscount());

            }
            session.setAttribute("cart", carts);
        }
        return "redirect:/product/" + id + "/" + name;
    }


    @PostMapping(value = "/comment")
    public ResponseEntity<AjaxResponse> comment(@RequestBody final Map<String, Object> data // co the hung du lieu (thay map bang object)
            , final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {

        System.out.println("========================================= Add Comment ==============================");

        ReviewProduct comment = new ReviewProduct();
        User user = userRepositories.findById(Integer.parseInt(data.get("idUser").toString()));
        Products product = productsRepositories.findProductsById(Integer.parseInt(data.get("idProduct").toString()));

        Date date = new Date();
        comment.setDate(date);
        comment.setComment(String.valueOf(data.get("comment")));
        comment.setUser(user);
        comment.setProduct(product);
        comment.setRating(Integer.parseInt(data.get("rating").toString()));

        reviewProductServices.saveCommentLv1(comment);

        return ResponseEntity.ok(new AjaxResponse("", 200));
    }

    @PostMapping(value = "/commentLv2")
    public ResponseEntity<AjaxResponse> saveCommentLv2(@RequestBody final Map<String, Object> data // co the hung du lieu (thay map bang object)
            , final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {

        System.out.println("========================================= Add Comment lv2==============================");

        ReviewProduct comment = new ReviewProduct();
        User user = userRepositories.findById(Integer.parseInt(data.get("idUser").toString()));
        Products product = productsRepositories.findProductsById(Integer.parseInt(data.get("idProduct").toString()));
        ReviewProduct reviewProduct = reviewProductRepositories.getOne(Integer.parseInt(data.get("idComment").toString()));

        Date date = new Date();
        comment.setDate(date);
        comment.setComment(String.valueOf(data.get("comment")));
        comment.setUser(user);
        comment.setProduct(product);
        comment.setReviewProduct(reviewProduct);

        reviewProductServices.saveCommentLv2(comment);

        return ResponseEntity.ok(new AjaxResponse("", 200));
    }

    @DeleteMapping("/remove_comment/{id}")
    public ResponseEntity<AjaxResponse> removeComment(@PathVariable Integer id, Model model, final HttpServletRequest request, final HttpServletResponse response) {

        reviewProductServices.deleteCommentLV1(id);
        reviewProductRepositories.deleteById(id);

        return ResponseEntity.ok(new AjaxResponse("", 200));
    }

    @GetMapping(value = "/comment-product/{id}")
    public String showComment(ModelMap model, @PathVariable int id, final HttpServletRequest request,
                              final HttpServletResponse response) {

        model.addAttribute("rating", reviewProductServices.findAllByIdProduct(id));

        return "ajax/comment";
    }

    @GetMapping(value = "/comment/{id}")
    public String showCommentLv2(ModelMap model, @PathVariable Integer id, final HttpServletRequest request,
                                 final HttpServletResponse response) {

        model.addAttribute("rating2", reviewProductServices.findCommentByIdComment(id));

        return "ajax/commentLv2";
    }

    @RequestMapping(value = "/living-search", method = {RequestMethod.GET})
    public String livingSearch(ModelMap model, @RequestParam(defaultValue = "") String search_query) {

        model.addAttribute("products", productsServices.selectNameProduct("%" + search_query + "%"));

        return "ajax/living-search";
    }

    @GetMapping("/products/search")
    public String searchPost(Model model, @RequestParam(defaultValue = "") String search_query,
                             final HttpServletRequest request, final HttpServletResponse response) {

        model.addAttribute("supplier", supplierServices.getAllSupplier());
        model.addAttribute("category", categoriesServices.getAllCategory());
        model.addAttribute("products", productsServices.selectNameProduct(search_query));

        return "search";
    }

}