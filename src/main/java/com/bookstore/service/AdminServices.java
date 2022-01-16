package com.bookstore.service;

import com.bookstore.entities.Admin;
import com.bookstore.model.dto.AdminDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AdminServices {
    int findIdByUserName(String username);

    boolean status_login(int id);

    int updateStatus(boolean status, int id);

    boolean insertAdmin(Admin admin, String username);

    List<AdminDto> findAll();

    AdminDto getEmployeeById(Integer id);

    AdminDto loadByUsername(String name);

    void updateAdmin(Admin admin, int id);

    void forgotPassword(String email, String username);
}
