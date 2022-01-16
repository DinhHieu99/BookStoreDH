package com.bookstore.service;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public interface PayZalo {
    JSONObject createOrder(String id, String appuser, int amount) throws Exception;
}
