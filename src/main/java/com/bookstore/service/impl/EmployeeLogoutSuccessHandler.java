package com.bookstore.service.impl;

import com.bookstore.model.dto.AdminDto;
import com.bookstore.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EmployeeLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler {

    @Autowired
    private AdminServices adminServices;

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {

        AdminDto adminDto = adminServices.loadByUsername(authentication.getName());
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getValue().equals(adminDto.getId())) {
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
        }

        adminServices.updateStatus(false, adminDto.getId());
        response.sendRedirect("/Admin/login");

        super.onLogoutSuccess(request, response, authentication);
    }
}