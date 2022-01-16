package com.bookstore.service;


import com.bookstore.entities.Cart;
import com.bookstore.model.dto.CartDto;
import com.bookstore.model.dto.OrderDto;
import org.springframework.stereotype.Service;

import javax.persistence.Query;
import java.util.List;
import java.util.Map;

@Service
public interface CartServices {
    void insertCart(List<CartDto> cart, int status, int idOrder);

    List<Cart> findByIdOrder(int id);

    List<OrderDto> getCartByIdOrder(int id);

    Map sumQuantity(int month, int year);

    void updateStatus(int status, int id);

    void deleteByIdOrder(int idOrder);
}
