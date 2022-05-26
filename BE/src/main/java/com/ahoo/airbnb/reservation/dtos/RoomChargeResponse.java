package com.ahoo.airbnb.reservation.dtos;

import com.ahoo.airbnb.reservation.Charges;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RoomChargeResponse {

	private int chargePerDay;
	private int totalCharge;
	private Charges charges;
}
