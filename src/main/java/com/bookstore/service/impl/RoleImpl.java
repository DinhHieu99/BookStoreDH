package com.bookstore.service.impl;

import com.bookstore.repositories.RoleRepositories;
import com.bookstore.service.RoleServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
public class RoleImpl implements RoleServices {
    @PersistenceContext
    protected EntityManager entityManager;
    @Autowired
    RoleRepositories roleRepositories;

    /*@Override
    public List<String> findNameById(Integer id) {
        String sql = "SELECT name FROM tbl_phanquyen WHERE id = " + id;
        Query query = entityManager.createNativeQuery(sql, String.class);
        return query.getSingleResult();
    }*/

    @Override
    public List<Integer> findRoleIdByAdminId(int id) {
        String sql = "SELECT role_id FROM admin_role WHERE admin_id = " + id;
        Query query = entityManager.createNativeQuery(sql, Integer.class);
        return query.getResultList();
    }
}
