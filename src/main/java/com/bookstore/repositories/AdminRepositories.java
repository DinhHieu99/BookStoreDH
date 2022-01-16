package com.bookstore.repositories;

import com.bookstore.entities.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepositories extends JpaRepository<Admin, Integer> {

    @Query("SELECT COUNT(e.id) FROM Admin e")
    int countAdmin();

    @Query("SELECT e.id FROM Admin e WHERE e.username= ?1")
    int findIdByUserName(String username );

    @Query("SELECT e.status_login FROM Admin e WHERE e.id = ?1")
    boolean status_login(int id);

    Admin findByUsername(String username);

}
