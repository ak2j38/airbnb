package com.ahoo.airbnb.reservation;

import java.util.ArrayList;
import java.util.List;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Charges {

	private List<Charge> charges = new ArrayList<>();

	public void add(Charge charge) {
		charges.add(charge);
	}
}
