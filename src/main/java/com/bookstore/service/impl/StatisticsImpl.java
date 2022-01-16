package com.bookstore.service.impl;

import com.bookstore.model.dto.SalesStatistics;
import com.bookstore.model.mapper.SalesStatisticsMapper;
import com.bookstore.repositories.CartRepositories;
import com.bookstore.service.StatisticsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class StatisticsImpl implements StatisticsServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    CartRepositories cartRepositories;

    @Override
    public List<SalesStatistics> findSalesStatistics(int status) {
        return SalesStatisticsMapper.convertSalesStatistics(cartRepositories.findCartByOrderIdAndStatus(status));
    }
}
