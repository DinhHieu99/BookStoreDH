package com.bookstore.model.mapper;

import com.bookstore.entities.Cart;
import com.bookstore.model.dto.OrderDto;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class OrderMapper {
    public static OrderDto toOrderMapper(Cart cart) {

        OrderDto order = new OrderDto();

        order.setId(cart.getProducts().getId());
        order.setImgProduct(cart.getProducts().getImgProduct());
        order.setProductName(cart.getProducts().getName());
        order.setPrice(cart.getDiscount());
        order.setQuantity(cart.getQuantity());
        order.setQuantityInStock(cart.getProducts().getQuantity());
        order.setMoney(cart.getMoney());

        return order;
    }

    public static List<OrderDto> convertOrderDto(List<Cart> carts) {
        List<OrderDto> orderDtos = new ArrayList<OrderDto>();

        for (int i = 0; i < carts.size(); i++) {
            orderDtos.add(toOrderMapper(carts.get(i)));
        }
        return orderDtos;
    }
}
