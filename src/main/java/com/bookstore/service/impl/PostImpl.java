package com.bookstore.service.impl;

import com.bookstore.entities.Post;
import com.bookstore.entities.Products;
import com.bookstore.model.dto.PostDto;
import com.bookstore.model.mapper.PostMapper;
import com.bookstore.repositories.PostRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.service.PostServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Component
public class PostImpl implements PostServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    PostRepositories postRepositories;

    @Override
    public List<Post> getPost() {
        String sql = "SELECT * FROM tbl_tintuc ORDER BY view DESC ";
        Query query = entityManager.createNativeQuery(sql, Post.class);
        return query.getResultList();
    }

    @Override
    public List<Post> getView() {
        String sql = "SELECT * FROM tbl_tintuc ORDER BY view DESC ";
        Query query = entityManager.createNativeQuery(sql, Post.class);
        return query.getResultList();
    }

    @Override
    public PostDto getPostById(int id) {
        return PostMapper.toPostDto(postRepositories.findPostById(id));
    }

    @Override
    public List<PostDto> findAll() {
        return PostMapper.convertPostDto(postRepositories.findAll());
    }
}
