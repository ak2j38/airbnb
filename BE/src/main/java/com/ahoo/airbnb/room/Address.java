package com.ahoo.airbnb.room;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Address {

	private String country;
	private String city;
	private String state;
	private String street;
	private String detailAddress;
}
