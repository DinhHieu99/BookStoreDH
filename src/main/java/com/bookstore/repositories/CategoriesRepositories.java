package com.bookstore.repositories;

import com.bookstore.entities.Categories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CategoriesRepositories extends JpaRepository<Categories, Integer>{

}
