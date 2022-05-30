package com.ahoo.airbnb.reservation.dtos;

import java.util.HashMap;
import java.util.Map;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ChargesResponse {

	private Map<String, Integer> charges = new HashMap<>();

	public void put(String policyName, int charge) {
		charges.put(policyName, charge);
	}
}
