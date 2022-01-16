package com.bookstore.service.impl;

import com.bookstore.entities.Contact;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.service.ContactServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Component
@Transactional
public class ContactImpl implements ContactServices {

    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    ContactRepositories contactRepositories;

    @Override
    public int count(Integer status) {
        return contactRepositories.count(status);
    }

    @Override
    public List<Contact> findAll(String status) {
        String sql = "SELECT * FROM tbl_lienhe WHERE status IN(" + status+ ")";
        Query query = entityManager.createNativeQuery(sql, Contact.class);
        return query.getResultList();
    }

    @Override
    public List<Contact> findAll() {
        return contactRepositories.findAll();
    }

    @Modifying
    @Override
    public int update(Contact contact, Integer id) {
        Query query = entityManager.createNativeQuery("UPDATE tbl_lienhe SET status = ?, feedback = ?," +
                        " create_date = ? WHERE id = ?").setParameter(1, contact.getStatus())
                .setParameter(2, contact.getFeedback()).setParameter(3, contact.getCreatedDate())
                .setParameter(4, id);
        query.executeUpdate();

        if (query.executeUpdate() == 1) {
            return 1;
        } else {
            return -1;
        }
    }

    @Modifying
    @Override
    public void updateStatus(int status, String id) {
        String sql = "UPDATE tbl_lienhe SET status = " + status + " WHERE id IN( " + id + ")";
        Query query = entityManager.createNativeQuery(sql, Contact.class);
        query.executeUpdate();
        /*Query query = entityManager.createNativeQuery("UPDATE tbl_lienhe SET status = ?" +
                        " WHERE id IN(?)").setParameter(1, status).setParameter(2, id);
        query.executeUpdate();*/
    }

    @Modifying
    @Override
    public void deleteById(String id) {
        String sql = "DELETE FROM tbl_lienhe WHERE id IN( " + id + ")";
        Query query = entityManager.createNativeQuery(sql, Contact.class);
        query.executeUpdate();
    }
}
