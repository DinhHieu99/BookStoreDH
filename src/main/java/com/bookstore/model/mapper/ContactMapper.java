package com.bookstore.model.mapper;

import com.bookstore.entities.Contact;
import com.bookstore.model.dto.ContactDto;

import java.util.ArrayList;
import java.util.List;

public class ContactMapper {
    public static ContactDto toContactDto(Contact contact){
        ContactDto contactDto = new ContactDto();

        contactDto.setId(contact.getId());
        contactDto.setFullName(contact.getFullName());
        contactDto.setEmail(contact.getEmail());
        contactDto.setAvatar(contact.getAvatar());
        contactDto.setSubject(contact.getSubject());
        contactDto.setContent(contact.getContent());
        contactDto.setStatus(contact.getStatus());
        contactDto.setCreateDate(contact.getCreatedDate());

        return contactDto;
    }

    public static List<ContactDto> convertContactDto(List<Contact> contacts){

        List<ContactDto> contactDtos = new ArrayList<ContactDto>();

        for(int i=0;i<contacts.size();i++){
            contactDtos.add(toContactDto(contacts.get(i)));
        }
        return contactDtos;

    }
}
