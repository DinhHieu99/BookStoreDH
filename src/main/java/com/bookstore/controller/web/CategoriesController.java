package com.bookstore.controller.web;

import com.bookstore.constant.IsExisting;
import com.bookstore.constant.ViewCart;
import com.bookstore.entities.Products;
import com.bookstore.model.dto.CartDto;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.ProductsServices;
import com.bookstore.service.SupplierServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoriesController {
    @Autowired
    ProductsServices productsServices;
    @Autowired
    ProductsRepositories productsRepositories;
    @Autowired
    CategoriesServices categoriesServices;

    @Autowired
    SupplierServices supplierServices;

    @GetMapping(value = {"/{id}-{name}"})
    public String productCategory(@PathVariable int id,
                                  @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                                  @RequestParam(name = "size", required = false, defaultValue = "8") Integer size,
                                  @RequestParam(name = "name", required = false, defaultValue = "nameProduct") String nameProduct,
                                  @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort,
                                  @RequestParam(name = "suppiler", required = false, defaultValue = "") String idSuppiler,
                                  @PathVariable String name, Model model, final HttpServletRequest request,
                                  final HttpServletResponse response) {

        ViewCart.getViewCart(model, request);
        model.addAttribute("category", categoriesServices.getAllCategory());
        model.addAttribute("supplier", supplierServices.getAllSupplier());

        model.addAttribute("category_sort", id);
        model.addAttribute("category_title", categoriesServices.getCategoryById(id));
        model.addAttribute("category_name", name);
        // cần lm lại
        try {
            // phân trang
            Sort sortable = null;
            Page<Products> list = null;
            String url = "";

            if (nameProduct.equals("nameProduct")) {
                url += "&name=nameProduct";
            }
            if (nameProduct.equals("discount")) {
                url += "&name=discount";
            }

            if (sort.equals("ASC")) {
                sortable = Sort.by(nameProduct).ascending();
                url += "&sort=ASC";

            }
            if (sort.equals("DESC")) {
                sortable = Sort.by(nameProduct).descending();
                url += "&sort=DESC";
            }

            if(idSuppiler != ""){
                url += "&suppiler="+ idSuppiler;
            }

            Pageable pageable = PageRequest.of(page - 1, size, sortable);
            list = productsRepositories.findProductsByIdCategories(id, idSuppiler, pageable);
            model.addAttribute("products", list.getContent());
            model.addAttribute("totalPage", list.getTotalPages());
            model.addAttribute("url", url);
            model.addAttribute("page", request.getParameter("page"));
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "categories";
    }

    public void quantity(Model model, final HttpServletRequest request) {
        HttpSession session = request.getSession();
        try {
            List<CartDto> carts = (List<CartDto>) session.getAttribute("cart");
            int quantity = carts.size();
            model.addAttribute("soLuongHang", quantity);
            double totalMoney = IsExisting.totalMoney(carts);
            model.addAttribute("ThanhTien", totalMoney);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}