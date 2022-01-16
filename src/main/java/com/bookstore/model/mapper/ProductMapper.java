package com.bookstore.model.mapper;

import com.bookstore.constant.VNCharacterUtils;
import com.bookstore.entities.Products;
import com.bookstore.model.dto.ProductDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ProductMapper {

    public static ProductDto toProductDto(Products products) {

        ProductDto product = new ProductDto();

        product.setId(products.getId());
        product.setUrlName(VNCharacterUtils.removeAccent(products.getName()));
        product.setName(products.getName());
        product.setImgProduct(products.getImgProduct());
        product.setStatus(products.getStatus());
        product.setDescribe(products.getDescribe());
        product.setPrice(products.getPrice());
        product.setDiscount(products.getDiscount());
        product.setPercentDiscount(products.getPercentDiscount());
        product.setQuantity(products.getQuantity());
        product.setSoLuongNhap(products.getSoLuongNhap());
        product.setAuthor(products.getAuthor());
        product.setCreateDate(products.getCreateDate());
        product.setView(products.getView());
        if(products.getCategories() == null){
            product.setCategoryName("");
            product.setIdCategory(null);
        }else{
            product.setIdCategory(products.getCategories().getId());
            product.setCategoryName(products.getCategories().getName());
        }

        if(products.getNhaCC() == null){
            product.setSupplierName(null);
        }else{
            product.setSupplierName(products.getNhaCC().getName());
        }

        return product;
    }

    public static List<ProductDto> convertProductDto(List<Products> products) {
        List<ProductDto> proDto = new ArrayList<ProductDto>();

        for (int i = 0; i < products.size(); i++) {
            proDto.add(toProductDto(products.get(i)));
        }
        return proDto;
    }

    /*public static Page<ProductDto> convertPageProduct(Page<Products> products){
        Page<ProductDto> productDtos = new Page<ProductDto>(products.getSize());
        return productDtos;
    }*/
}
