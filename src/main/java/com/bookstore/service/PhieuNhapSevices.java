package com.bookstore.service;

import com.bookstore.entities.PhieuNhap;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PhieuNhapSevices {
    List<PhieuNhap> findAll();
}
