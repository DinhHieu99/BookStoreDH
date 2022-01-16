package com.bookstore.constant;

import com.bookstore.model.dto.CartDto;

import java.util.List;
import java.util.Set;

public class IsExisting {
    public static int isExisting(int id, List<CartDto> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
    public static double totalMoney(List<CartDto> cart) {
        double count = 0;
        for (int i = 0; i < cart.size(); i++) {
            count += cart.get(i).getMoney();
        }
        return count;
    }

}
