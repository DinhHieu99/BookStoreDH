package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InvoiceDto {
    private Integer id;
    private String customerName;
    private String mobile;
    private String email;
    private String address;
    private Boolean pay;
    private Date date;
    private Integer totalMoney;
    private Integer status;
    private String message;

}
