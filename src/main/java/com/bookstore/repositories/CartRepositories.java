package com.bookstore.repositories;

import com.bookstore.entities.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepositories extends JpaRepository<Cart, Integer> {
    @Query("SELECT SUM(e.quantity) FROM Cart e INNER JOIN Invoice h ON e.order.id = h.id WHERE MONTH(h.created) = ?1 AND " +
            "YEAR(h.created) = ?2 AND ( h.status = ?3 OR h.pay =?4)")
    Long sumQuantity(int month, int year, int status, boolean pay);

    @Query("SELECT e FROM Cart e INNER JOIN Invoice h ON e.order.id = h.id WHERE h.status =?1")
    List<Cart> findCartByOrderIdAndStatus(int status);

}
