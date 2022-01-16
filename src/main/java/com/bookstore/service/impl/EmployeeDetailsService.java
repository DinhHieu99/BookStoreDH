package com.bookstore.service.impl;

import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.service.AdminServices;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.security.auth.login.LoginException;
import java.util.HashSet;
import java.util.Set;

@Service
public class EmployeeDetailsService implements UserDetailsService {
    @Autowired
    AdminServices adminServices;

    @Autowired
    AdminRepositories adminRepositories;

    @SneakyThrows
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        System.out.println("username: " + username);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        AdminDto admin = adminServices.loadByUsername(username);
        if (admin == null) {
            throw new UsernameNotFoundException("Username not found");
        }
        if (admin.getStatus_login() == true){
            grantedAuthorities.add(new SimpleGrantedAuthority(admin.getRole()));
            adminServices.updateStatus(true, admin.getId());
        }
        else{
            throw new LoginException(username +" này không được phép đăng nhập");
        }
        return new org.springframework.security.core.userdetails.User( admin.getUsername(), admin.getPassword(), grantedAuthorities);
    }

}
