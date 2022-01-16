package com.bookstore.service;


import com.bookstore.entities.User;
import com.bookstore.model.dto.UserDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserServices {
    UserDto findById(int id);

    int updateStatus(int status, int id);

    List<UserDto> findAll(String status);

    String findPasswordById(int id);

    void updateUser(User users, Integer id);

    Boolean insertUser(User user);
}
