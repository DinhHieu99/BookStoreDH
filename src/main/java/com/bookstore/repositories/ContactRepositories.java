package com.bookstore.repositories;

import com.bookstore.entities.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactRepositories extends JpaRepository<Contact, Integer> {

    @Query("SELECT COUNT(e.id) FROM Contact e WHERE e.status = ?1")
    int count(Integer status);
}
