package com.bookstore.service.impl;

import com.bookstore.entities.Admin;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.service.AdminServices;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@Component
public class EmployeeLoginHandler implements AuthenticationSuccessHandler {

    @Autowired
    AdminServices adminServices;
    @Autowired
    AdminRepositories adminRepositories;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(final HttpServletRequest request, final HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        AdminDto adminDto = adminServices.loadByUsername(authentication.getName());
        String username = authentication.getName();

        int id = adminServices.findIdByUserName(username);
        List<Admin> admins = adminRepositories.findAll();
        boolean url = false;
        for (Admin tk : admins) {
            if (adminDto.getUsername().equals(tk.getUsername()) && adminDto.getPassword().equals(tk.getPassword())) {
                if (adminRepositories.status_login(id) == true) {

                    adminServices.updateStatus(true, id);
                    Cookie cookie = new Cookie("id", String.valueOf(adminDto.getId()));

                    cookie.setMaxAge(24*60 * 60);
                    cookie.setSecure(true);
                    cookie.setHttpOnly(true);
                    cookie.setPath("/admin");
                    response.addCookie(cookie);
                    url = true;
                }else{
                    url =false;
                }
            }else{
                url =false;
            }

        }

        if(url = true){
            redirectStrategy.sendRedirect(request, response, "/admin");
        }else {
            redirectStrategy.sendRedirect(request, response, "/Admin/login");
        }
    }


}
