package com.bookstore.controller.payWithZaloPay;

import com.bookstore.repositories.InvoiceRepositories;
import com.bookstore.service.InvoiceServices;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.util.Map;
import java.util.logging.Logger;

@Controller
public class RedirectController {
    @Autowired
    InvoiceServices invoiceServices;

    @Autowired
    InvoiceRepositories invoiceRepositories;
    private Logger logger = Logger.getLogger(this.getClass().getName());
    private String key2 = "Iyz2habzyr7AG8SgvoBCbKwKi3UzlLi3";
    private Mac HmacSHA256;

    public RedirectController() throws Exception  {
        HmacSHA256 = Mac.getInstance("HmacSHA256");
        HmacSHA256.init(new SecretKeySpec(key2.getBytes(), "HmacSHA256"));
    }

    @GetMapping("/redirect-from-zalopay")
    public String redirect(@RequestParam Map<String, String> data, ModelMap model) {

        String checksumData = data.get("appid") +"|"+ data.get("apptransid") +"|"+ data.get("pmcid") +"|"+ data.get("bankcode") +"|"+
                data.get("amount") +"|"+ data.get("discountamount") +"|"+ data.get("status");
        byte[] checksumBytes = HmacSHA256.doFinal(checksumData.getBytes());
        //Dùng để kiểm tra redirect có hợp lệ hay không.
        String checksum = DatatypeConverter.printHexBinary(checksumBytes).toLowerCase();

        JSONObject result = new JSONObject();
        if (!checksum.equals(data.get("checksum"))) {
            invoiceServices.deleteById(invoiceRepositories.findIdByApptransid(data.get("apptransid").toString()));
            //return ResponseEntity.badRequest().body("Bad Request");
            model.addAttribute("message", "Bad Request");
            return "404";
        } else {
            // kiểm tra xem đã nhận được callback hay chưa, nếu chưa thì tiến hành gọi API truy vấn trạng thái thanh toán của đơn hàng để lấy kết quả cuối cùng
            invoiceServices.updateStatusByApptransid(1, data.get("apptransid").toString());
            return "redirect:/ZaloPayOnl";
            //return ResponseEntity.ok("OK");
        }
    }
}