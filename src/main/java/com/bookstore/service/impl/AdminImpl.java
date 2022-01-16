package com.bookstore.service.impl;


import com.bookstore.entities.Admin;
import com.bookstore.entities.User;
import com.bookstore.exception.ApiRequestException;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.model.mapper.AdminMapper;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.SendMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Random;

@Component
@Transactional
public class AdminImpl implements AdminServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    AdminRepositories adminRepositories;

    @Autowired
    SendMail sendMail;

    @Override
    public int findIdByUserName(String username) {
        return adminRepositories.findIdByUserName(username);
    }

    @Override
    public boolean status_login(int id) {
        return adminRepositories.status_login(id);
    }

    @Modifying
    @Override
    public int updateStatus(boolean status, int id) {
        String sql = "UPDATE tbl_nhanvien SET status = " + status + " WHERE id =" + id;
        Query query = entityManager.createNativeQuery(sql, Admin.class);
        return query.executeUpdate();
    }

    @Override
    public boolean insertAdmin(Admin admin, String username) {
        Query query = entityManager.createNativeQuery("SELECT *FROM tbl_nhanvien WHERE username = '"+username+"'", Admin.class);
        if (query.getResultList().size() > 0) {
            return false;
        } else {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
            admin.setPassword(encoder.encode(admin.getPassword()));
            adminRepositories.save(admin);
            return true;
        }
    }

    @Override
    public List<AdminDto> findAll() {
        List<Admin> admin = adminRepositories.findAll();
        return AdminMapper.convertAdminDto(admin);
    }

    @Override
    public AdminDto getEmployeeById(Integer id) {
        if(id == null){
            throw new ApiRequestException("Hết hạn cookies bạn cần đăng nhập lại");
        }else{
            return AdminMapper.toAdminDto(adminRepositories.getOne(id));
        }
    }

    @Override
    public AdminDto loadByUsername(String userName) {
        return AdminMapper.toAdminDto(adminRepositories.findByUsername(userName));
    }

    @Modifying
    @Override
    public void updateAdmin(Admin admin, int id) {
        Query query = entityManager.createNativeQuery(
                        "UPDATE tbl_nhanvien SET address = ?, email = ?, avatar = ?, mobile = ?, name = ?," +
                                "password = ? WHERE id = ?", Admin.class)
                .setParameter(1, admin.getAddress()).setParameter(2, admin.getEmail())
                .setParameter(3, admin.getImg()).setParameter(4, admin.getMobile())
                .setParameter(5, admin.getName()).setParameter(6, admin.getPassword())
                .setParameter(7, id);
        query.executeUpdate();

    }

    @Modifying
    @Override
    public void forgotPassword(String email, String username) {
        Query query = entityManager.createNativeQuery("SELECT *FROM tbl_nhanvien WHERE username = '"+username+"'", Admin.class);
        if (query.getResultList().size() == 1 ) {
            Admin admin = adminRepositories.findByUsername(username);
            if(admin.getEmail().equals(email) == true) {
                String subject = "[THÔNG BÁO] - Thông tin cấp mật khẩu dịch vụ công";
                String content = "Mật khẩu được cấp lại cho tài khoản " + username + " là: ";
                Random rnd = new Random();
                int number = rnd.nextInt(999999);

                content += String.format("%06d", number);
                sendMail.sendSimpleMessage(email, subject, content);

                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
                admin.setPassword(encoder.encode(String.format("%06d", number)));
                adminRepositories.save(admin);
            }
        }
    }
}
