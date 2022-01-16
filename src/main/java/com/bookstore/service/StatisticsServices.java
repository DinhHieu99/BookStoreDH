package com.bookstore.service;

import com.bookstore.model.dto.SalesStatistics;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StatisticsServices {
    List<SalesStatistics> findSalesStatistics(int status);
}
