package com.bookstore.repositories;

import com.bookstore.entities.ReviewProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewProductRepositories extends JpaRepository<ReviewProduct, Integer> {
    @Query("SELECT COUNT(e.id) FROM ReviewProduct e WHERE e.product.id = ?1")
    int countComment(int id);

    @Query("SELECT SUM(e.rating) FROM ReviewProduct e WHERE e.product.id = ?1")
    int sumRating(int id);
}
