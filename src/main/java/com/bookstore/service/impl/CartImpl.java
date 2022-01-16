package com.bookstore.service.impl;

import com.bookstore.entities.Cart;
import com.bookstore.entities.Products;
import com.bookstore.model.dto.CartDto;
import com.bookstore.model.dto.InvoiceDto;
import com.bookstore.model.dto.OrderDto;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.model.mapper.OrderMapper;
import com.bookstore.model.mapper.ProductMapper;
import com.bookstore.repositories.CartRepositories;
import com.bookstore.service.CartServices;
import com.bookstore.service.InvoiceServices;
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
public class CartImpl implements CartServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    CartRepositories cartRepositories;

    @Autowired
    InvoiceServices invoiceServices;

    @Modifying
    @Override
    public void insertCart(List<CartDto> cart, int status, int idOrder) {

        for (int i = 0; i < cart.size(); i++) {
            Query query1 = entityManager.createNativeQuery("INSERT INTO tbl_giohang(discount, money, " +
                    "quantity, status, idOrder, idProducts) VALUES (" + cart.get(i).getDiscount() + ","
                    + cart.get(i).getMoney() + "," + cart.get(i).getQuantity() + "," + status + "," + idOrder + ","
                    + cart.get(i).getId() + ")", Cart.class);
            query1.executeUpdate();
        }
    }

    @Override
    public List<Cart> findByIdOrder(int id) {
        String sql = "SELECT * FROM tbl_giohang WHERE idOrder = " + id;
        Query query = entityManager.createNativeQuery(sql, Cart.class);
        return query.getResultList();
    }

    @Override
    public List<OrderDto> getCartByIdOrder(int id) {
        String sql = "SELECT * FROM tbl_giohang WHERE idOrder = " + id;
        Query query = entityManager.createNativeQuery(sql, Cart.class);
        return OrderMapper.convertOrderDto(query.getResultList());

    }

    @Override
    public Map sumQuantity(int month, int year) {
        LinkedHashMap<Integer, Long> map = new LinkedHashMap<>();
        Long quantity;
        for(int i=1;i<=12;i++){
            quantity = cartRepositories.sumQuantity(i, year,3,true);
            if(quantity != null){
                map.put(i, quantity);
            }
        }
        return map;
    }

    @Modifying
    @Override
    public void updateStatus(int status, int id) {
        String sql = "UPDATE tbl_giohang SET status = " +status +" WHERE  id = " + id;
        Query query = entityManager.createNativeQuery(sql, Cart.class);
        query.executeUpdate();
    }

    @Modifying
    @Override
    public void deleteByIdOrder(int idOrder) {
        String sql = "DELETE FROM tbl_giohang WHERE idOrder = " + idOrder;
        Query query = entityManager.createNativeQuery(sql, Cart.class);
        query.executeUpdate();
    }


}
