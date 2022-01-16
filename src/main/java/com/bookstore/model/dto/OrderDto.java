package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {

    private Integer id;
    private String productName;
    private String imgProduct;
    private Integer quantity;
    private Integer price;
    private Integer money;
    private Integer quantityInStock;
}
