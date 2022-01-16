package com.bookstore.service;

import com.bookstore.entities.Contact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class SendMail {
    private JavaMailSender javaMailSender;
    @Autowired
    private SendMail(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public void sendSimpleMessage(String email, String subject, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("BookstoreDinhHieu@gmail.com");
        message.setTo(email);
        message.setSubject(subject);
        message.setText(content);
        javaMailSender.send(message);

    }

    public void sendMailWithAttachments(String email, String subject, String content) throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("BookstoreDinhHieu@gmail.com");
        helper.setTo(email);
        helper.setSubject(subject);
        helper.setText(content, true);

        javaMailSender.send(message);
    }
}
