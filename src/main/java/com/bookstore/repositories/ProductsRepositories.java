package com.bookstore.repositories;

import com.bookstore.entities.Products;
import com.bookstore.model.dto.ProductDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface ProductsRepositories extends JpaRepository<Products, Integer> {
    Products findProductsById(Integer id);

    @Query("SELECT SUM(e.quantity) FROM Products e WHERE e.categories.id = ?1")
    Integer sumQuantityByIdCategory(int id);

    @Query("SELECT e FROM Products e ORDER BY e.quantity ASC ")
    List<Products> findProductsOrderByQuantity();

    @Query("SELECT e.view FROM Products e WHERE e.id=?1")
    int view(int id);

    @Modifying
    @Query("UPDATE Products e SET e.view =?1 WHERE e.id=?2")
    int updateView(int view, int id);

    @Query(value = "SELECT * FROM tbl_sanpham WHERE idDM = :idCategory OR idNCC IN (:suppiler)", nativeQuery = true)
    Page<Products> findProductsByIdCategories(@Param("idCategory") int idCategory, @Param("suppiler") String idSuppiler, Pageable pageable);
}
