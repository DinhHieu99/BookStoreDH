package com.bookstore.model.mapper;

import com.bookstore.entities.User;
import com.bookstore.model.dto.UserDto;

import java.util.ArrayList;
import java.util.List;

public class UserMapper {
    public static UserDto toUserDto(User user) {
        UserDto tmp = new UserDto();

        tmp.setId(user.getId());
        tmp.setName(user.getName());
        tmp.setAvatar(user.getAvatar());
        tmp.setEmail(user.getEmail());
        tmp.setMobile(user.getMobile());
        tmp.setAddress(user.getAddress());
        tmp.setStatus(user.getStatus());
        tmp.setUser_status(user.getUser_status());
        tmp.setCreateDate(user.getCreated());

        return tmp;
    }

    public static List<UserDto> convertContactDto(List<User> users) {

        List<UserDto> userDtos = new ArrayList<UserDto>();

        for (int i = 0; i < users.size(); i++) {
            userDtos.add(toUserDto(users.get(i)));
        }
        return userDtos;

    }
}
