package com.bookstore.model.mapper;

import com.bookstore.entities.Admin;
import com.bookstore.model.dto.AdminDto;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class AdminMapper {
    public static AdminDto toAdminDto(Admin admin){
        AdminDto tmp = new AdminDto();

        tmp.setId(admin.getId());
        tmp.setName(admin.getName());
        tmp.setAddress(admin.getAddress());
        tmp.setStatus(admin.isStatus());
        tmp.setMobile(admin.getMobile());
        tmp.setEmail(admin.getEmail());
        tmp.setAvatar(admin.getImg());
        tmp.setUsername(admin.getUsername());
        tmp.setStatus_login(admin.getStatus_login());
        tmp.setPassword(admin.getPassword());
        tmp.setIdRole(admin.getRole().getId());
        tmp.setRole(admin.getRole().getName());

        return tmp;
    }

    public static List<AdminDto> convertAdminDto(List<Admin> admin){
        List<AdminDto> adminDtos = new ArrayList<AdminDto>();

        for(int i=0;i<admin.size();i++){
            adminDtos.add(toAdminDto(admin.get(i)));
        }
        return adminDtos;
    }
}
