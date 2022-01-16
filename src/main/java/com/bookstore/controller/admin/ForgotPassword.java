package com.bookstore.controller.admin;

import com.bookstore.exception.AjaxResponse;
import com.bookstore.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class ForgotPassword {
    @Autowired
    AdminServices adminServices;

    @GetMapping("/forgot-password")
    public String forgotPassword(Model model, final HttpServletRequest request, final HttpServletResponse response){

        System.out.println("======================================= FORGOT PASS ============================");
        return "admin/forgot-password";
    }

    @PostMapping("/send-password")
    public ResponseEntity<AjaxResponse> sendPassword(@RequestBody final Map<String, Object> data,
                                                     Model model, final HttpServletRequest request, final HttpServletResponse response){
        System.out.println("======================================= FORGOT PASS 2 ============================");
        adminServices.forgotPassword(data.get("email").toString(), data.get("username").toString());

        return ResponseEntity.ok(new AjaxResponse("Thành công", HttpStatus.OK));
    }
}
