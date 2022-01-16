package com.bookstore.service;

import com.bookstore.entities.PhieuNhap;
import com.bookstore.entities.Products;
import com.bookstore.model.dto.ProductDto;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface ProductsServices {
    List<ProductDto> findProductByCategoryIdAndLimit(Integer id, Integer limit);

    List<ProductDto> findProductByIdCategory(Integer id);

    ProductDto findProductById(Integer id);

    List<ProductDto> findAllProducts();

    List<ProductDto> findAllProductsByQuantity();

    List<ProductDto> selectNameProduct(String title);

    List<ProductDto> sortName(Integer id, String name, String sort);

    List<ProductDto> mostView();

    void saveAddNewProduct(Products product, PhieuNhap phieuNhap);

    Integer sumQuantityByIdCategory(Integer id);

    void updateQuantity(Integer id, Integer quantity);

    Map quantityCategoryProduct();

    /*List<ProductDto> findAllByCategoryId(Integer offset, Integer maxResult);

    Long count();*/

}
