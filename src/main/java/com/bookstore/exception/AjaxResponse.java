package com.bookstore.exception;

import org.springframework.http.HttpStatus;

import java.io.Serializable;

public class AjaxResponse implements Serializable {
    private static final long serialVersionUID = 425776080671021969L;

    private String message;
    private int statusCode;
    private HttpStatus status;
    public AjaxResponse(String message, int statusCode) {
        super();
        this.message = message;
        this.statusCode = statusCode;
    }

    public AjaxResponse(String message, HttpStatus status) {
        super();
        this.message = message;
        this.status = status;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public int getStatusCode() {
        return statusCode;
    }
    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }
}

