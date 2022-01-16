package com.bookstore.controller.admin;

import com.bookstore.entities.PhieuNhap;
import com.bookstore.entities.Products;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.repositories.ReviewProductRepositories;
import com.bookstore.repositories.SupplierRepositories;
import com.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

@Controller
@RequestMapping("/admin")
public class ProductManangementController {
    @Autowired
    ProductsServices productsServices;
    @Autowired
    ProductsRepositories productsRepositories;
    @Autowired
    ContactServices contactServices;
    @Autowired
    CategoriesServices categoriesServices;
    @Autowired
    SupplierServices supplierServices;
    @Autowired
    ReviewProductServices reviewProductServices;
    @Autowired
    ReviewProductRepositories reviewProductRepositories;
    @Autowired
    AdminServices adminServices;
    @Autowired
    PhieuNhapRepositories phieuNhapRepositories;
    @Autowired
    SupplierRepositories supplierRepositories;
    @Value("${file.upload.path}")
    private String attachmentPath;

    @GetMapping(value = {"/data-table-products"})
    public String dataTablesProducts(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("products", productsServices.findAllProducts());
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        return "admin/ProductManagement/data-list-products";
    }

    @DeleteMapping(value = {"/removeProduct/{productsId}"})
    public String removeProducts(@PathVariable int productsId, Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {

        productsRepositories.deleteById(productsId);
        model.addAttribute("products", productsServices.findAllProducts());

        return "redirect:/admin/data-table-products";
    }


    @GetMapping(value = {"/product-{id}"})
    public String detailProduct(@PathVariable int id, Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("category", categoriesServices.findAll());
        model.addAttribute("user", idAdmin);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("product", productsServices.findProductById(id));
        model.addAttribute("rating", reviewProductServices.findAllByIdProduct(id));
        try {
            int count = reviewProductRepositories.countComment(id);
            int sumRating = reviewProductRepositories.sumRating(id);

            model.addAttribute("avgStar", sumRating / count);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/ProductManagement/detail-product";
    }

    @GetMapping(value = {"/add-new-product"})
    public String addNewProduct(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("category", categoriesServices.findAll());
        model.addAttribute("user", idAdmin);
        model.addAttribute("ncc", supplierServices.getAllSupplier());
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/ProductManagement/add-new-product";
    }

    @PostMapping(value = {"/add-new-product"})
    public String saveNewProducts(@RequestParam("image") MultipartFile productImage,
                                  @ModelAttribute("phieuNhap") PhieuNhap pn, Model model, final HttpServletRequest request,
                                  final HttpServletResponse response) throws IllegalStateException, IOException {

        Products product = new Products();
        if (productImage != null && productImage.getSize() > 0) {
            productImage.transferTo(new File(attachmentPath + "/" + productImage.getOriginalFilename()));
            product.setImgProduct(productImage.getOriginalFilename());
        }

        productsServices.saveAddNewProduct(product, pn);

        return "redirect:/admin/add-new-product";
    }

    @GetMapping(value = {"/addProduct-{id}"})
    public String addProduct(@PathVariable int id, Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("category", categoriesServices.findAll());
        model.addAttribute("user", idAdmin);
        model.addAttribute("ncc", supplierServices.getAllSupplier());
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("products", productsServices.findProductById(id));

        return "admin/ProductManagement/add-product";
    }

    @PostMapping(value = {"/add-product"})
    public String saveProducts(@RequestParam("image") MultipartFile productImage,
                               @ModelAttribute("phieuNhap") PhieuNhap pn, Model model, final HttpServletRequest request,
                               final HttpServletResponse response) throws IllegalStateException, IOException {

        Products product = new Products();
        if (productImage != null && productImage.getSize() > 0) {
            productImage.transferTo(new File(attachmentPath + "/" + productImage.getOriginalFilename()));
            product.setImgProduct(productImage.getOriginalFilename());

        }

        /* ====== save phieu nhap============== */
        Date date = new Date();

        pn.setPrice(pn.getAmount() * pn.getQuantity());
        pn.setCreateDate(date);

        /* ====== save sản phẩm============== */
        product.setCreateDate(date);
        product.setName(pn.getName());
        product.setPrice(pn.getAmount());
        product.setQuantity(pn.getQuantity());
        product.setDescribe(pn.getProduct().getDescribe());
        product.setStatus(pn.getProduct().getStatus());
        pn.setProduct(product);
        //NhaCC ncc = nhaCCRepositories.getOne(pn.getProduct().getNhaCC().getId());
        //product.setNhaCC(ncc);
        product.setAuthor(pn.getProduct().getAuthor());

        productsRepositories.save(product);
        phieuNhapRepositories.save(pn);

        return "redirect:/admin//addProduct-" + product.getId();
    }

    @GetMapping(value = {"/edit-product/{id}"})
    public String editProducts(@PathVariable int id, Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request,
                               final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        ProductDto products = productsServices.findProductById(id);
        model.addAttribute("products", products);
        model.addAttribute("category", categoriesServices.findAll());
        HttpSession sesion = request.getSession();
        sesion.setAttribute("date", products.getCreateDate());
        model.addAttribute("ncc", supplierServices.getAllSupplier());
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/ProductManagement/edit-product";
    }

    @PostMapping(value = {"/edit-product"})
    public String editSaveProducts(@RequestParam("image") MultipartFile productImage,
                                   @ModelAttribute("product") Products product, Model model, final HttpServletRequest request,
                                   final HttpServletResponse response) throws IllegalStateException, IOException, ParseException {

        ProductDto productDto = productsServices.findProductById(product.getId());
        HttpSession session = request.getSession();
        if (productImage != null && productImage.getSize() > 0) {
            productImage.transferTo(new File(attachmentPath + "/" + productImage.getOriginalFilename()));
            product.setImgProduct(productImage.getOriginalFilename());
        } else {
            product.setImgProduct(productDto.getImgProduct());
        }
        product.getPrice();
        int phanTramGiamGia = product.getPercentDiscount();
        product.setDiscount(product.getPrice() / 100 * (100 - phanTramGiamGia));

        product.setView(productDto.getView());
        Date date = (Date) session.getAttribute("date");
        product.setCreateDate(date);
        productsRepositories.save(product);

        session.removeAttribute("date");

        return "redirect:/admin/data-table-products";
    }
}
