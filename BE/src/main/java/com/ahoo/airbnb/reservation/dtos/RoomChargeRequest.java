package com.ahoo.airbnb.reservation.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RoomChargeRequest {

	private String checkInDate;
	private String checkOutDate;
	private Integer headcount;
}
