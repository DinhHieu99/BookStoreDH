package com.bookstore.service.impl;

import com.bookstore.entities.PhieuNhap;
import com.bookstore.repositories.CartRepositories;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.service.PhieuNhapSevices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class PhieuNhapImpl implements PhieuNhapSevices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    PhieuNhapRepositories phieuNhapRepositories;

    @Override
    public List<PhieuNhap> findAll() {
        return phieuNhapRepositories.findAll();
    }
}
