package com.bookstore.service;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleServices {
    //List<String> findNameById(Integer id);
    List<Integer> findRoleIdByAdminId(int id);
}
