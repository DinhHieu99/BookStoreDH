package com.bookstore.model.mapper;

import com.bookstore.entities.Cart;
import com.bookstore.model.dto.CartDto;

import java.util.HashMap;
import java.util.List;

public class CartDtoMapper {
    public static CartDto toCartDtoMapper(Cart cart) {

        CartDto CartDto = new CartDto();

        CartDto.setId(cart.getProducts().getId());
        CartDto.setName(cart.getProducts().getName());
        CartDto.setDiscount(cart.getDiscount());
        CartDto.setQuantity(cart.getQuantity());
        CartDto.setMoney(cart.getMoney());

        return CartDto;
    }
/*
    public static HashMap convertCartDtoDto(List<Cart> carts) {



        return CartDto;
    }*/
}
