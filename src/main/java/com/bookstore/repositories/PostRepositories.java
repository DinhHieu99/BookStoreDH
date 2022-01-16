package com.bookstore.repositories;

import com.bookstore.entities.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepositories extends JpaRepository<Post, Integer> {
    Post findPostById(int id);
}
