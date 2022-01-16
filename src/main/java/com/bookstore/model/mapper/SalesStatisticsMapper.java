package com.bookstore.model.mapper;

import com.bookstore.entities.Cart;
import com.bookstore.model.dto.SalesStatistics;

import java.util.ArrayList;
import java.util.List;

public class SalesStatisticsMapper {
    public static SalesStatistics toSalesStatistics(Cart cart){
        SalesStatistics salesStatistics = new SalesStatistics();

        salesStatistics.setQuantity(cart.getQuantity());
        salesStatistics.setNameProduct(cart.getProducts().getName());
        salesStatistics.setPrice(cart.getMoney());
        salesStatistics.setId(cart.getProducts().getId());
        salesStatistics.setDate(cart.getOrder().getCreated());
        salesStatistics.setQuantityInStock(cart.getProducts().getQuantity());
        return  salesStatistics;
    }

    public static List<SalesStatistics> convertSalesStatistics(List<Cart> cartList) {
        List<SalesStatistics> salesStatistics = new ArrayList<SalesStatistics>();

        for (int i = 0; i < cartList.size(); i++) {
            salesStatistics.add(toSalesStatistics(cartList.get(i)));
        }
        return salesStatistics;
    }
}
