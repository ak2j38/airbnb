package com.ahoo.airbnb.reservation.dtos;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class ReservationRequest {

	private long roomId;
	private String checkInDate;
	private String checkOutDate;
	private int headcount;
	private int totalCharge;
}
