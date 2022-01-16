package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
    private Integer id;
    private String name;
    private String img;
    private Integer quantity;
    private Integer discount;
    private Integer money;
}
