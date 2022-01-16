package com.bookstore.service;


import com.bookstore.entities.Invoice;
import com.bookstore.model.dto.InvoiceDto;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface InvoiceServices {
    void insert(Invoice invoice, Integer idUser);

    void updateApptransidById(String apptransid, String id);

    void updateStatusByApptransid(int status, String apptransid);

    List<InvoiceDto> getInvoiceByPayAndStatus(boolean pay, int status);

    List<Invoice> getAllInvoiceByIdUser(int id, boolean status_delete);

    List<Invoice> getInvoiceByid(String listId, boolean status_delete);

    void updateStatusDelete(boolean status_delete, int id);

    boolean checkIdOrder( int idUser, int id);

    int maxIdUser();

    List<InvoiceDto> getAllDESC(int limit);

    Invoice findById(int id);

    void updateStatus(int status, int id);

    List<InvoiceDto> findAll(String status);

    Map selectInvoiceInDate(int date);

    List<InvoiceDto> selectInvoiceByMonth(String title);

    Map sumTotalMoneyByMonth(Integer month, Integer year);

    void deleteById(int id);

    void updatePay(boolean pay, int id);

}
