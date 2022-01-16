package com.bookstore.service;

import com.bookstore.entities.Categories;
import com.bookstore.model.dto.CategoryDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CategoriesServices {
    List<CategoryDto> getAllCategory();

    CategoryDto getCategoryById(int id);

    List<CategoryDto> findAll();
}
