package com.bookstore.service.impl;

import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;

import javax.naming.AuthenticationException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class EmployeeAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        // Login failed by max session
        if (exception.getClass().isAssignableFrom(SessionAuthenticationException.class)) {
            response.sendRedirect(request.getContextPath() + "/login?message=max_session");
            return;
        }
        response.sendRedirect(request.getContextPath() + "/login?message=error");
    }
}
