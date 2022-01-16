package com.bookstore.service;

import com.bookstore.entities.Contact;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.util.List;

@Service
public interface ContactServices {

    int count(Integer status);

    List<Contact> findAll(String status);

    List<Contact> findAll();

    int update(Contact contact, Integer id);

    void updateStatus(int status, String id);

    void deleteById(String id);
}
