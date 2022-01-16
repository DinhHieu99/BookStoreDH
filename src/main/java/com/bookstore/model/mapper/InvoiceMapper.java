package com.bookstore.model.mapper;

import com.bookstore.entities.Invoice;
import com.bookstore.model.dto.InvoiceDto;

import java.util.ArrayList;
import java.util.List;

public class InvoiceMapper {

    public static InvoiceDto toInvoiceDto(Invoice invoice) {
        InvoiceDto tmp = new InvoiceDto();

        tmp.setId(invoice.getId());
        tmp.setAddress(invoice.getDeliveryAddress());
        tmp.setCustomerName(invoice.getFullName());
        tmp.setTotalMoney(invoice.getTotalMoney());
        tmp.setMobile(invoice.getMobile());
        tmp.setEmail(invoice.getEmail());
        tmp.setPay(invoice.getPay());
        tmp.setDate(invoice.getCreated());
        tmp.setCustomerName(invoice.getFullName());
        tmp.setStatus(invoice.getStatus());
        tmp.setMessage(invoice.getMessage());

        return tmp;
    }

    public static List<InvoiceDto> convertInvoiceDto(List<Invoice> invoices) {

        List<InvoiceDto> invoiceDtos = new ArrayList<InvoiceDto>();

        for (int i = 0; i < invoices.size(); i++) {
            invoiceDtos.add(toInvoiceDto(invoices.get(i)));
        }
        return invoiceDtos;

    }
}
