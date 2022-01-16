package com.bookstore.controller.admin;

import com.bookstore.entities.Contact;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.exception.AjaxResponse;
import com.bookstore.repositories.ContactRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.ContactServices;
import com.bookstore.service.SendMail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.Map;

@RequestMapping("/admin")
@Controller
public class ContactManagementController {
    @Autowired
    ContactRepositories contactRepositories;
    @Autowired
    ContactServices contactServices;

    @Autowired
    AdminServices adminServices;

    @Autowired
    SendMail sendMail;

    private Logger logger = LoggerFactory.getLogger(ContactServices.class);

    @GetMapping(value = {"/contacts"})
    public String contact(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("mail", contactServices.count(0));
        model.addAttribute("sendMail", contactServices.count(1));
        model.addAttribute("contact", contactServices.findAll("0, 2"));
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/ContactManagement/SendMail/inbox";
    }

    @GetMapping(value = {"/send-mail"})
    public String sendMail(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("mail", contactServices.count(0));
        model.addAttribute("sendMail", contactServices.count(1));
        model.addAttribute("contact", contactServices.findAll("1"));
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/ContactManagement/SendMail/ComposeEmail";
    }
    @GetMapping(value = {"/sent-mail"})
    public String sentMail(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("mail", contactServices.count(0));
        model.addAttribute("sendMail", contactServices.count(1));
        model.addAttribute("contact", contactServices.findAll("1"));
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/ContactManagement/SendMail/inbox";
    }

    @GetMapping(value = {"/sendMail/id={id}"})
    public String editContact(@PathVariable int id, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, Model model, final HttpServletRequest request,
                              final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        Contact contact = contactRepositories.getOne(id);
        model.addAttribute("mail", contactServices.count(0));
        model.addAttribute("sendMail", contactServices.count(1));
        model.addAttribute("contact", contact);
        model.addAttribute("contactHeader", contactServices.findAll("0"));
        contactServices.updateStatus(2, String.valueOf(id));

        return "admin/ContactManagement/SendMail/feedbackEmail";
    }

    @PostMapping("/sentMail")
    public ResponseEntity<AjaxResponse> sent_mail(@RequestBody final Map<String, Object> data, Model model, final HttpServletRequest request,
                                                  final HttpServletResponse response) throws MessagingException {

        Calendar calendar = Calendar.getInstance();

        Contact contact = new Contact();
        contact.setStatus(1);
        contact.setCreatedDate(calendar.getTime());
        contact.setFeedback(String.valueOf(data.get("feedback")));
        contact.setEmail(String.valueOf(data.get("email")));
        contact.setFullName(String.valueOf(data.get("fullName")));
        contact.setSubject(String.valueOf(data.get("subject")));
        contact.setContent("");
        if (String.valueOf(data.get("avatar")) == null || String.valueOf(data.get("avatar")).equals("") == true) {
            contact.setAvatar("avatar.png");
        } else {
            contact.setAvatar(String.valueOf(data.get("avatar")));
        }
        sendMail.sendMailWithAttachments(contact.getEmail(), contact.getSubject(), contact.getFeedback());
        contactRepositories.save(contact);

        return ResponseEntity.ok(new AjaxResponse("", HttpStatus.OK));
    }

    @PostMapping("/sendFeedback")
    public String feedbackMail(@ModelAttribute("contact") Contact contact, Model model, final HttpServletRequest request,
                               final HttpServletResponse response) throws MessagingException {

        Calendar calendar = Calendar.getInstance();

        Contact contact1 = new Contact();
        contact1.setStatus(1);
        contact1.setFeedback(contact.getFeedback());
        contact1.setCreatedDate(calendar.getTime());

        sendMail.sendMailWithAttachments(contact.getEmail(), contact.getSubject(), contact.getFeedback());
        contactServices.update(contact1, contact.getId());
        return "redirect:/admin/contacts";
    }

    @PutMapping("/remove-mail")
    public ResponseEntity<AjaxResponse> removeMail(@RequestBody final Map<String, Object> data,
                                                   Model model, final HttpServletRequest request, final HttpServletResponse response) {

        contactServices.updateStatus(3, data.get("id").toString());
        return ResponseEntity.ok(new AjaxResponse("", HttpStatus.OK));
    }

    @GetMapping(value = {"/trash-mail"})
    public String trash(Model model, @CookieValue(value = "id", defaultValue = "") Integer idAdmin, final HttpServletRequest request, final HttpServletResponse response) {

        AdminDto adminDto = adminServices.getEmployeeById(idAdmin);
        model.addAttribute("admin", adminDto);
        model.addAttribute("mail", contactServices.count(0));
        model.addAttribute("sendMail", contactServices.count(1));
        model.addAttribute("contact", contactServices.findAll("3"));
        model.addAttribute("contactHeader", contactServices.findAll("0"));

        return "admin/ContactManagement/SendMail/inbox";
    }

    @DeleteMapping("/delete-mail")
    public ResponseEntity<AjaxResponse> deleteMail(@RequestBody final Map<String, Object> data,
                                                   Model model, final HttpServletRequest request, final HttpServletResponse response) {

        contactServices.deleteById(data.get("id").toString());
        return ResponseEntity.ok(new AjaxResponse("", HttpStatus.OK));
    }
}
