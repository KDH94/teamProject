package com.example.test1.model;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentDetail {
    private int paymentNo;
    private int itemNo;
    private int sellCnt;
    private String itemName;
    private int price;
    private float sRate;
    private float pRate;
    private String paytime;
    }
