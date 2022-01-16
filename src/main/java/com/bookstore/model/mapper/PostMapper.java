package com.bookstore.model.mapper;

import com.bookstore.entities.Post;
import com.bookstore.model.dto.PostDto;

import java.util.ArrayList;
import java.util.List;

public class PostMapper {
    public static PostDto toPostDto(Post post) {
        PostDto postDto = new PostDto();

        postDto.setId(post.getId());
        postDto.setTitle(post.getTitle());
        postDto.setDescription(post.getDescription());
        postDto.setDetails(post.getDetails());
        postDto.setImage(post.getImage());
        postDto.setCreatedDate(post.getCreatedDate());
        postDto.setStatus(post.getStatus());
        postDto.setView(post.getView());
        postDto.setAuthor(post.getAdmin().getName());

        return postDto;
    }

    public static List<PostDto> convertPostDto(List<Post> posts) {
        List<PostDto> postDtos = new ArrayList<PostDto>();

        for (int i = 0; i < posts.size(); i++) {
            postDtos.add(toPostDto(posts.get(i)));
        }

        return postDtos;
    }
}
