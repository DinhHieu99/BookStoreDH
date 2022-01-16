package com.bookstore.controller.admin;

import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.PhieuNhapRepositories;
import com.bookstore.repositories.ProductsRepositories;
import com.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;

@Controller
@RequestMapping("/admin")
public class StatisticsManagementController {

    @Autowired
    StatisticsServices statisticsServices;
    @Autowired
    PhieuNhapSevices phieuNhapSevices;
    @Autowired
    ContactServices contactServices;
    @Autowired
    InvoiceServices invoiceServices;
    @Autowired
    CartServices cartServices;
    @Autowired
    AdminServices adminServices;

    @GetMapping(value = { "/data-table-sales-statistics" })
    public String dataSalesStatistics(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        System.out.println("----------------------------- Sales Statistics --------------------------------");
        Calendar calendar = Calendar.getInstance();
        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("statistics", statisticsServices.findSalesStatistics(3));
        model.addAttribute("totalRevenue", invoiceServices.sumTotalMoneyByMonth(calendar.get(Calendar.MONTH), calendar.get(Calendar.YEAR)));
        model.addAttribute("sellQuantity", cartServices.sumQuantity(calendar.get(Calendar.MONTH), calendar.get(Calendar.YEAR)));
        return "admin/StatisticsManagement/data-list-sales-statistics";
    }

    @GetMapping(value = { "/data-table-import-statistics" })
    public String dataImportStatistics(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        System.out.println("----------------------------- Import Statistics --------------------------------");
        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        model.addAttribute("import_statistics", phieuNhapSevices.findAll());

        return "admin/ImportStatisticsManagement/data-list-import-statistics";
    }
}
