package com.ahoo.airbnb.reservation;

import com.ahoo.airbnb.reservation.dtos.ReservationRequest;
import com.ahoo.airbnb.reservation.dtos.RoomChargeRequest;
import com.ahoo.airbnb.reservation.dtos.RoomChargeResponse;
import org.springframework.stereotype.Service;

@Service
public class MockReservationService {

	public RoomChargeResponse calculateTotalChargeOf(long roomId, RoomChargeRequest roomChargeRequest) {
		Charges charges = new Charges();
		charges.add(new Charge("기본요금", 1322396));
		charges.add(new Charge("4% 주 단위 요금 할인", -55948));
		charges.add(new Charge("청소비", 25966));
		charges.add(new Charge("서비스 수수료", 8188));
		charges.add(new Charge("숙박세와 수수료", 819));
		return new RoomChargeResponse(70358, 1488195, charges);
	}

	public void reserve(ReservationRequest reservationRequest) {
	}
}
