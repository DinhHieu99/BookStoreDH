package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {

    private Integer id;
    private String urlName;
    private String name;
    private String imgProduct;
    private Boolean status;
    private String describe;
    private Integer price;
    private Integer discount;
    private Integer percentDiscount;
    private Integer quantity;
    private Integer soLuongNhap;
    private String author;
    private Date createDate;
    private Integer view;
    private String supplierName;
    private Integer idCategory;
    private String categoryName;
}
