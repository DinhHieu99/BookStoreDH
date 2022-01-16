package com.bookstore.service.impl;

import com.bookstore.entities.Categories;
import com.bookstore.model.dto.CategoryDto;
import com.bookstore.model.mapper.CategoryMapper;
import com.bookstore.repositories.CategoriesRepositories;
import com.bookstore.service.CategoriesServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
public class CategoriesImpl implements CategoriesServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    CategoriesRepositories categoriesRepositories;

    @Override
    public List<CategoryDto> getAllCategory() {
        String sql = "SELECT * FROM tbl_danhmuc where status = true";
        Query query = entityManager.createNativeQuery(sql, Categories.class);
        return CategoryMapper.convertToCategoryDto(query.getResultList());
    }

    @Override
    public CategoryDto getCategoryById(int id) {
        Categories categories = categoriesRepositories.getOne(id);
        return CategoryMapper.toCategoryDto(categories);
    }

    @Override
    public List<CategoryDto> findAll() {
        return CategoryMapper.convertToCategoryDto(categoriesRepositories.findAll());
    }
}
