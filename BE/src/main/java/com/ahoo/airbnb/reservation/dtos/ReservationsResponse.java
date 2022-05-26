package com.ahoo.airbnb.reservation.dtos;

import java.util.ArrayList;
import java.util.List;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ReservationsResponse {

	private List<ReservationResponse> reservations = new ArrayList<>();

	public void add(ReservationResponse reservationResponse) {
		reservations.add(reservationResponse);
	}
}
