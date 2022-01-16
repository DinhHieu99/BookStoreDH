package com.bookstore.service.impl;

import com.bookstore.entities.PhieuNhap;
import com.bookstore.entities.Products;
import com.bookstore.entities.Supplier;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.model.mapper.ProductMapper;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.repositories.SupplierRepositories;
import com.bookstore.service.CategoriesServices;
import com.bookstore.service.ProductsServices;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.*;

@Component
@Transactional
public class ProductsImpl implements ProductsServices {
    @PersistenceContext
    protected EntityManager entityManager;
    @Autowired
    ProductsRepositories productsRepositories;
    @Autowired
    PhieuNhapRepositories phieuNhapRepositories;
    @Autowired
    SupplierRepositories supplierRepositories;
    @Autowired
    CategoriesServices categoriesServices;

    @Override
    public List<ProductDto> findProductByCategoryIdAndLimit(Integer id, Integer limit) {
        String sql = "SELECT * FROM tbl_sanpham WHERE idDM = " + id + " ORDER BY id DESC LIMIT " + limit;
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return ProductMapper.convertProductDto(query.getResultList());
    }

    @Override
    public List<ProductDto> findProductByIdCategory(Integer id) {
        String sql = "SELECT * FROM tbl_sanpham WHERE idDM = " + id;
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return ProductMapper.convertProductDto(query.getResultList());
    }

    @Override
    public ProductDto findProductById(Integer id) {
        return ProductMapper.toProductDto(productsRepositories.getOne(id));
    }

    @Override
    public List<ProductDto> findAllProducts() {
        String sql = "SELECT * FROM tbl_sanpham";
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return ProductMapper.convertProductDto(query.getResultList());
    }

    @Override
    public List<ProductDto> findAllProductsByQuantity() {
        /*String sql = "SELECT * FROM tbl_sanpham ORDER BY quantity ASC";
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return ProductMapper.convertProductDto(query.getResultList());*/
        return ProductMapper.convertProductDto(productsRepositories.findProductsOrderByQuantity());
    }

    @Override
    public List<ProductDto> selectNameProduct(String title) {
        String sql = "SELECT * FROM tbl_sanpham WHERE LOWER(nameProduct) LIKE LOWER('%" + title + "%') OR LOWER(author) LIKE LOWER('%" + title + "%')";
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return ProductMapper.convertProductDto(query.getResultList());
    }

    @Override
    public List<ProductDto> sortName(Integer id, String name, String sort) {
        String sql = "SELECT * FROM tbl_sanpham WHERE idDM = " + id + " ORDER BY " + name + " " + sort;
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return ProductMapper.convertProductDto(query.getResultList());
    }

    @Override
    public List<ProductDto> mostView() {
        String sql = "SELECT * FROM tbl_sanpham ORDER BY view DESC";
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return ProductMapper.convertProductDto(query.getResultList());
    }

    @Modifying
    @Override
    public void saveAddNewProduct(Products product, PhieuNhap pn) {
        /* ====== save phieu nhap============== */
        Calendar calendar = Calendar.getInstance();

        pn.setPrice(pn.getAmount() * pn.getQuantity());
        pn.setCreateDate(calendar.getTime());

        /* ====== save sản phẩm============== */
        product.setCreateDate(calendar.getTime());
        product.setName(pn.getName());
        product.setPrice(pn.getAmount());
        product.setQuantity(pn.getQuantity());
        product.setDescribe(pn.getProduct().getDescribe());
        product.setStatus(pn.getProduct().getStatus());
        product.setDiscount(pn.getAmount());
        product.setPercentDiscount(0);
        product.setView(0);
        product.setCategories(pn.getProduct().getCategories());
        product.setAuthor(pn.getProduct().getAuthor());
        product.setNhaCC(pn.getProduct().getNhaCC());
        pn.setProduct(product);

        /*Supplier supplier = new Supplier();
        supplier.setName(product.getNhaCC().getName());
        supplierRepositories.save(supplier);*/

        product.setAuthor(pn.getProduct().getAuthor());

        productsRepositories.save(product);
        phieuNhapRepositories.save(pn);
    }

    @Override
    public Integer sumQuantityByIdCategory(Integer id) {
        return productsRepositories.sumQuantityByIdCategory(id);
    }

    @Modifying
    @Override
    public void updateQuantity(Integer id, Integer quantity) {
        String sql = "UPDATE tbl_sanpham SET quantity = " + quantity + " WHERE id = " + id;
        Query query = entityManager.createNativeQuery(sql, Products.class);
        query.executeUpdate();
    }

    @Override
    public Map quantityCategoryProduct() {
        int size = categoriesServices.getAllCategory().size();
        Integer quantityCategory;
        String nameCategory = "";
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (int i = 0; i < size; i++) {
            nameCategory = categoriesServices.getAllCategory().get(i).getName();
            quantityCategory = sumQuantityByIdCategory(categoriesServices.getAllCategory().get(i).getId());
            if(quantityCategory == null){
                map.put(nameCategory, 0);
            }else{
                map.put(nameCategory, quantityCategory);
            }
        }
        return map;
    }
}
