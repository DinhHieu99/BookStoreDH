package com.bookstore.repositories;

import com.bookstore.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepositories extends JpaRepository<Role, Integer> {
    Role findByName(int id);

    @Query("SELECT e.name FROM Role e WHERE e.id= ?1")
    String findNameById(int id);
}
