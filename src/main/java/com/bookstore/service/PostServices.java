package com.bookstore.service;

import com.bookstore.entities.Post;
import com.bookstore.model.dto.PostDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PostServices {
    List<Post> getPost();

    List<Post> getView();

    PostDto getPostById(int id);

    List<PostDto> findAll();
}
