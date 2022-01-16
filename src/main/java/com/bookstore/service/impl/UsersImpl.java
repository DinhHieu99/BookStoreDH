package com.bookstore.service.impl;

import com.bookstore.entities.User;
import com.bookstore.model.dto.UserDto;
import com.bookstore.model.mapper.UserMapper;
import com.bookstore.repositories.UserRepositories;
import com.bookstore.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
@Transactional
public class UsersImpl implements UserServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    UserRepositories userRepositories;


    @Override
    public UserDto findById(int id) {
        User user = userRepositories.findById(id);
        return UserMapper.toUserDto(user);

    }

    @Modifying
    @Override
    public int updateStatus(int status, int id) {
        String sql = "UPDATE tbl_khachhang SET status = " + status + " WHERE id =" + id;
        Query query = entityManager.createNativeQuery(sql, User.class);
        return query.executeUpdate();
    }

    @Override
    public List<UserDto> findAll(String status) {
        String sql = "SELECT *FROM tbl_khachhang WHERE status IN(" + status +")";
        Query query = entityManager.createNativeQuery(sql, User.class);
        return UserMapper.convertContactDto(query.getResultList());
    }

    @Override
    public String findPasswordById(int id) {
        User users = userRepositories.getOne(id);
        return users.getPassword();
    }

    @Modifying
    @Override
    public void updateUser(User user, Integer id) {
        Query query = entityManager.createNativeQuery(
                        "Update tbl_khachhang set address = ?, mobile =?, email =?, name=?, password =?, status=?, user_status =?, avatar =?" +
                                " WHERE id = ?",
                        User.class).setParameter(1, user.getAddress()).setParameter(2, user.getMobile())
                .setParameter(3, user.getEmail()).setParameter(4, user.getName())
                .setParameter(5, user.getPassword()).setParameter(6, user.getStatus())
                .setParameter(7, user.getUser_status()).setParameter(8, user.getAvatar())
                .setParameter(9, user.getId());
        query.executeUpdate();
    }

    @Modifying
    @Override
    public Boolean insertUser(User user) {
        Query query = entityManager.createNativeQuery("SELECT *FROM tbl_khachhang WHERE email = ?", User.class)
                .setParameter(1, user.getEmail());
        if (query.getResultList().size() > 0) {
            return false;
        } else {
            entityManager.createNativeQuery(
                            "INSERT INTO tbl_khachhang(address, created, email, mobile ,name, password, status," +
                                    " user_status, avatar) VALUES(?,?,?,?,?,?,?,?,?)")
                    .setParameter(1, user.getAddress()).setParameter(2, user.getCreated())
                    .setParameter(3, user.getEmail())
                    .setParameter(4, user.getMobile()).setParameter(5, user.getName())
                    .setParameter(6, user.getPassword()).setParameter(7, user.getStatus())
                    .setParameter(8, true).setParameter(9, user.getAvatar())
                    .executeUpdate();
            return true;
        }
    }

}
