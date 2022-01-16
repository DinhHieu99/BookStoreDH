package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChartJsDto {

    private String lable;
    private Integer quanity;
    private String barColor;
}
