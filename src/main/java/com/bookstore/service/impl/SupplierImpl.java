package com.bookstore.service.impl;

import com.bookstore.entities.Supplier;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.repositories.SupplierRepositories;
import com.bookstore.service.SupplierServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class SupplierImpl implements SupplierServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    SupplierRepositories supplierRepositories;

    @Override
    public List<Supplier> getAllSupplier() {
        List<Supplier> suppliers = supplierRepositories.findAll();
        return suppliers;
    }
}
