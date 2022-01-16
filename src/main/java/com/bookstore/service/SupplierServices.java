package com.bookstore.service;

import com.bookstore.entities.Supplier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SupplierServices {
    List<Supplier> getAllSupplier();
}
