package com.bookstore.repositories;

import com.bookstore.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierRepositories extends JpaRepository<Supplier, Integer> {

}
