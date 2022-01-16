package com.bookstore.model.mapper;

import com.bookstore.constant.VNCharacterUtils;
import com.bookstore.entities.Categories;
import com.bookstore.model.dto.CategoryDto;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class CategoryMapper {
    public static CategoryDto toCategoryDto(Categories categories) {
        CategoryDto categoryDto = new CategoryDto();

        categoryDto.setId(categories.getId());
        categoryDto.setName(categories.getName());
        categoryDto.setDescribe(categories.getDescribe());
        categoryDto.setStatus(categories.getStatus());
        categoryDto.setUrl(VNCharacterUtils.removeAccent(categories.getName()));

        return categoryDto;
    }

    public static List<CategoryDto> convertToCategoryDto(List<Categories> categories) {

        List<CategoryDto> categoryDtos = new ArrayList<CategoryDto>();

        for (int i = 0; i < categories.size(); i++) {
            categoryDtos.add(toCategoryDto(categories.get(i)));
        }
        return categoryDtos;
    }
}
