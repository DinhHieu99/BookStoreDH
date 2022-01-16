package com.bookstore.service.impl;

import com.bookstore.entities.Invoice;
import com.bookstore.model.dto.InvoiceDto;
import com.bookstore.model.dto.OrderDto;
import com.bookstore.model.dto.ProductDto;
import com.bookstore.model.mapper.InvoiceMapper;
import com.bookstore.repositories.InvoiceRepositories;
import com.bookstore.service.CartServices;
import com.bookstore.service.InvoiceServices;
import com.bookstore.service.ProductsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.*;

@Component
@Transactional
public class InvoiceImpl implements InvoiceServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    InvoiceRepositories invoiceRepositories;

    @Autowired
    ProductsServices productsServices;

    @Autowired
    CartServices cartServices;

    @Modifying
    @Override
    public void insert(Invoice hd, Integer idUser) {
        Query query = entityManager
                .createNativeQuery("" + "INSERT INTO tbl_hoadon(created, status, "
                        + " totalMoney, message, pay, deliveryAddress,fullName, mobile, email, status_delete)"
                        + "VALUES(?,?,?,?,?,?,?,?,?,?)")
                .setParameter(1, hd.getCreated()).setParameter(2, hd.getStatus()).setParameter(3, hd.getTotalMoney())
                .setParameter(4, hd.getMessage()).setParameter(5, hd.getPay()).setParameter(6, hd.getDeliveryAddress())
                .setParameter(7, hd.getFullName()).setParameter(8, hd.getMobile()).setParameter(9, hd.getEmail())
                .setParameter(10, hd.getStatusDelete());
        query.executeUpdate();
    }

    @Modifying
    @Override
    public void updateApptransidById(String apptransid, String id) {
        String sql = "UPDATE tbl_hoadon SET apptransid = '" + apptransid + "' WHERE id = " + id;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        query.executeUpdate();
    }

    @Modifying
    @Override
    public void updateStatusByApptransid(int status, String apptransid) {
        String sql = "UPDATE tbl_hoadon SET status = " + status + " WHERE apptransid = '" + apptransid + "'";
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        query.executeUpdate();
    }

    @Override
    public List<InvoiceDto> getInvoiceByPayAndStatus(boolean pay, int status) {
        String sql = "SELECT * FROM tbl_hoadon WHERE status IN (" + status + ") AND pay = " +pay;;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        return InvoiceMapper.convertInvoiceDto(query.getResultList());
    }

    @Override
    public List<Invoice> getAllInvoiceByIdUser(int id, boolean status_delete) {
        String sql = "SELECT * FROM tbl_hoadon WHERE idUser = " + id + " AND status_delete = " + status_delete;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        return query.getResultList();
    }

    @Override
    public List<Invoice> getInvoiceByid(String listId, boolean status_delete) {
        String sql = "SELECT * FROM tbl_hoadon WHERE id IN ( " + listId + " ) AND status_delete = " + status_delete;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        return query.getResultList();
    }

    @Modifying
    @Override
    public void updateStatusDelete(boolean status_delete, int id) {
        String sql = "UPDATE tbl_hoadon SET status_delete = " + status_delete + " WHERE id = " + id;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        query.executeUpdate();
    }

    @Override
    public boolean checkIdOrder(int idUser, int id) {
        boolean status_delete;
        return status_delete = invoiceRepositories.checkIdOrder(idUser, id);
    }

    @Override
    public int maxIdUser() {
        return invoiceRepositories.maxIdUser();
    }

    @Override
    public List<InvoiceDto> getAllDESC(int limit) {
        String sql = "SELECT * FROM tbl_hoadon ORDER BY id DESC LIMIT " + limit;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        return InvoiceMapper.convertInvoiceDto(query.getResultList());
    }

    @Override
    public Invoice findById(int id) {
        return invoiceRepositories.findById(id);
    }

    @Modifying
    @Override
    public void updateStatus(int status, int id) {
        Invoice invoice = invoiceRepositories.findById(id);
        List<OrderDto> cart = cartServices.getCartByIdOrder(id);

        int quantity = 0;
        if (status == 1 && (invoice.getStatus() == 0 || invoice.getStatus() == 4)) {
            // tinh giảm tồn kho
            for (int i = 0; i < cart.size(); i++) {
                ProductDto products = productsServices.findProductById(cart.get(i).getId());
                quantity = products.getQuantity() - cart.get(i).getQuantity();
                if (quantity > 0) {
                    if (cartServices.findByIdOrder(id).get(i).getStatus() == 0) {
                        productsServices.updateQuantity(cart.get(i).getId(), quantity);
                        cartServices.updateStatus(1, cartServices.findByIdOrder(id).get(i).getId());
                        invoiceRepositories.updateStatus(1, id);
                    }
                } else {
                    for (i = 0; i < cart.size(); i++) {
                        if (cartServices.findByIdOrder(id).get(i).getStatus() == 1) {
                            quantity = products.getQuantity() + cart.get(i).getQuantity();
                            productsServices.updateQuantity(cart.get(i).getId(), quantity);
                            cartServices.updateStatus(0, cartServices.findByIdOrder(id).get(i).getId());
                        }
                    }
                    invoiceRepositories.updateStatus(4, id);
                }
            }
        }
        if (status == 1 && invoice.getStatus() == 0) {
            invoiceRepositories.updateStatus(1, id);
        }
        if (status == 2 && invoice.getStatus() == 1) {
            invoiceRepositories.updateStatus(2, id);
        }
        if (status == 3 && invoice.getStatus() == 2) {
            invoiceRepositories.updateStatus(3, id);
            Calendar calendar = Calendar.getInstance();
            invoiceRepositories.updateDateInvoice(calendar.getTime(), id);
            updatePay(true, id);
        }
        if (status == 4 && invoice.getStatus() == 0) {
            invoiceRepositories.updateStatus(4, id);

        }
        if (status == 5) {

            for (int i = 0; i < cart.size(); i++) {
                ProductDto products = productsServices.findProductById(cart.get(i).getId());
                if (cartServices.findByIdOrder(id).get(i).getStatus() == 1) {
                    quantity = products.getQuantity() + cart.get(i).getQuantity();
                    productsServices.updateQuantity(cart.get(i).getId(), quantity);
                    cartServices.updateStatus(0, cartServices.findByIdOrder(id).get(i).getId());
                }
            }
            invoiceRepositories.updateStatus(5, id);
        }
    }

    @Override
    public List<InvoiceDto> findAll(String status) {
        String sql = "SELECT * FROM tbl_hoadon WHERE status IN (" + status + ")";
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        return InvoiceMapper.convertInvoiceDto(query.getResultList());
    }

    @Override
    public Map selectInvoiceInDate(int date) {
        Map<String, Integer> map = new HashMap<>();
        int countInvoice = invoiceRepositories.selectInvoiceInDate(date);
        int countInvoicePre = invoiceRepositories.selectInvoiceInDate(date - 1);

        map.put("countInvoice", countInvoice);
        map.put("percent", countInvoice / countInvoicePre * 100);

        return map;
    }

    @Override
    public List<InvoiceDto> selectInvoiceByMonth(String title) {
        String sql = "select *from tbl_hoadon where month(created) = '" + title + "'";
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        return InvoiceMapper.convertInvoiceDto(query.getResultList());
    }
// cần làm lại
    @Override
    public Map sumTotalMoneyByMonth(Integer month, Integer year) {

        LinkedHashMap<String, Double> map = new LinkedHashMap<>();
        Double sumTotal;
        for (int i = 1; i <= 12; i++) {
            sumTotal = invoiceRepositories.sumTotalMoneyByMonth(i, year, 3, true);
            if (sumTotal != null) {
                String key = String.valueOf(i + " - " + year);
                map.put(key, sumTotal / 1000);
            }
        }
        return map;
    }

    @Modifying
    @Override
    public void deleteById(int id) {
        Invoice invoice = invoiceRepositories.findById(id);
        if (invoice.getStatus() == 0) {
            String sql = "DELETE FROM tbl_hoadon WHERE id = " + id;
            Query query = entityManager.createNativeQuery(sql, Invoice.class);
            query.executeUpdate();
            cartServices.deleteByIdOrder(id);
        }
    }

    @Modifying
    @Override
    public void updatePay(boolean pay, int id) {
        String sql = "UPDATE tbl_hoadon SET pay = " + pay + " WHERE id = " + id;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);
        query.executeUpdate();
    }
/*
    @Override
    public String getIdInvoiceByMonth(int month, int year) {
        String sql = "SELECT id FROM tbl_hoadon WHERE MONTH(created) = " +month +" AND YEAR(created) = " + year;
        Query query = entityManager.createNativeQuery(sql, Invoice.class);

        *//*String listId="";
        System.out.println("id hoa don: "+query.getResultList());
        if (query.getResultList() == null){
            return listId;
        }else{
            for (Object list: query.getResultList()) {
                listId += list +", ";
            }
            System.out.println("id hoa don: " + listId.substring(0, listId.length() - 2));
            return listId.substring(0, listId.length() - 2);
        }*//*
        System.out.println("id invoice: " +query.getResultList());
        return "";
    }*/

}
