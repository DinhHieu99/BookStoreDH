package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SalesStatistics {
    private Integer quantity;
    private Integer id;
    private String nameProduct;
    private Integer price;
    private Date date;
    private Integer quantityInStock;
}
