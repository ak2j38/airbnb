package com.ahoo.airbnb.entity;

import javax.persistence.Embeddable;

@Embeddable
public class Address {

    private String country;
    private String city;
    private String state;
    private String street;
    private String detailAddress;
}
