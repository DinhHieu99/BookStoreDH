package com.bookstore.repositories;

import com.bookstore.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepositories extends JpaRepository<User, Integer> {
    User findById(int id);

    User findByEmail(String email);
}
