package com.ahoo.airbnb.room;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Address {

	private String roomType;
	private int maxCapacity;
	private int bedroomCount;
	private int bedCount;
	private int bathroomCount;
}
