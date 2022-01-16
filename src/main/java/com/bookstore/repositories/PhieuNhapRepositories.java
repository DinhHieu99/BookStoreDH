package com.bookstore.repositories;

import com.bookstore.entities.PhieuNhap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhieuNhapRepositories extends JpaRepository<PhieuNhap, Integer> {

}
