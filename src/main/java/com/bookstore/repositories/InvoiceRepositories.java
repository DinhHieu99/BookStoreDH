package com.bookstore.repositories;

import com.bookstore.entities.Invoice;
import org.hibernate.annotations.Parameter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Transactional
@Repository
public interface InvoiceRepositories extends JpaRepository<Invoice, Integer> {

    @Query("SELECT e.statusDelete FROM Invoice e WHERE e.user.id = ?1 AND e.id = ?2")
    boolean checkIdOrder(int idUser, int id);

    @Query("SELECT e.statusDelete FROM Invoice e WHERE e.id = ?1")
    boolean checkStatus_DeleteIdOrder(int id);

    @Query("SELECT MAX(e.user.id) FROM Invoice e")
    int maxIdUser();

    @Query("SELECT e.id FROM Invoice e WHERE e.apptransid = ?1")
    int findIdByApptransid(String apptransid);

    @Modifying
    @Query(value = "UPDATE tbl_hoadon SET status = ?1 WHERE id = ?2", nativeQuery = true)// nativeQuery = true: dùng như truy vấn trong sql
    void updateStatus(int status, int id);

    @Modifying
    @Query(value = "UPDATE tbl_hoadon SET created = ?1 WHERE id = ?2", nativeQuery = true)
    void updateDateInvoice(Date date, int id);

    Invoice findById(int id);

    @Query(value = "SELECT COUNT(id) FROM tbl_hoadon WHERE date(created) = ?1", nativeQuery = true)
    int selectInvoiceInDate(int date);

    @Query(value = "SELECT SUM(e.totalMoney) FROM Invoice e WHERE MONTH(e.created) = ?1", nativeQuery = true)
    int sumMoneyByMonth(int month);

    @Query("SELECT SUM(e.totalMoney) FROM Invoice e WHERE DATE(e.created) = DATE(?1) ")
    int sumMoneyByDate(String date);

    @Query("SELECT SUM(e.totalMoney) FROM Invoice e WHERE MONTH(e.created) = ?1 AND YEAR(e.created) = ?2 AND (e.status =?3 OR e.pay = ?4)")
    Double sumTotalMoneyByMonth(Integer month, Integer year, Integer status, Boolean statusPay);


}
