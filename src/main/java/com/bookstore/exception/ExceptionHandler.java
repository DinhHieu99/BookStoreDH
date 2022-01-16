package com.bookstore.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import java.time.ZoneId;
import java.time.ZonedDateTime;
/*
 * @RestControllerAdvice là một Annotation gắn trên Class.
 * Có tác dụng xen vào quá trình xử lý của các @RestController. Tương tự với @ControllerAdvice
 *
 * @RestControllerAdvice thường được kết hợp với @ExceptionHandler để cắt ngang quá trình xử lý của Controller,
 *  và xử lý các ngoại lệ xảy ra.
 * */

/*Tạo EXception Handler*/
@RestControllerAdvice
public class ExceptionHandler {
    /**
     * BadRequest sẽ được xử lý riêng tại đây
     */
    @org.springframework.web.bind.annotation.ExceptionHandler(ApiRequestException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handlerIntenalServerErrorException(ApiRequestException ex, WebRequest req) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("status", HttpStatus.INTERNAL_SERVER_ERROR);
        mav.addObject("message", ex.getMessage());
        mav.addObject("url", "/Admin/login");
        mav.addObject("message_url", "Vào trang đăng nhập");
        mav.setViewName("admin/error/404");
        return mav;
        //return new ApiException(HttpStatus.INTERNAL_SERVER_ERROR, ex.getMessage());

    }
    /**
     *  NotFound sẽ được xử lý riêng tại đây
     */
    @org.springframework.web.bind.annotation.ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handlerNotFoundException(NotFoundException ex, WebRequest req) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("status", HttpStatus.NOT_FOUND);
        mav.addObject("message", ex.getMessage());
        mav.addObject("url", "/admin");
        mav.addObject("message_url", "Trang chủ");
        mav.setViewName("admin/error/404");
        return mav;
    }
}
