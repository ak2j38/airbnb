package com.ahoo.airbnb.reservation;

import com.ahoo.airbnb.member.MemberResponse;
import com.ahoo.airbnb.reservation.dtos.ReservationRequest;
import com.ahoo.airbnb.reservation.dtos.ReservationResponse;
import com.ahoo.airbnb.reservation.dtos.ReservationsResponse;
import com.ahoo.airbnb.reservation.dtos.RoomChargeRequest;
import com.ahoo.airbnb.reservation.dtos.RoomChargeResponse;
import com.ahoo.airbnb.room.Address;
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

	public ReservationsResponse reservations() {
		ReservationsResponse reservations = new ReservationsResponse();
		reservations.add(new ReservationResponse(
			1L,
			3,
			1488195,
			"♥️2차는 여기! \uD83C\uDF7E생일파티\uD83C\uDF7A회식❤️강남최고의 가성비!",
			"집전체",
			"https://a0.muscache.com/im/pictures/e6bb8c75-de6e-4422-af13-fdbbfbe19a0d.jpg?im_w=720",
			"2022/05/28",
			"2022/05/29",
			new Address("한국", "서울", "서초구", "서초 4동", "비밀"),
			new MemberResponse(1, "우진팍",
				"https://avatars.githubusercontent.com/u/29879110?v=4")
		));
		reservations.add(new ReservationResponse(
			2L,
			3,
			1488195,
			"♥️2차는 여기! \uD83C\uDF7E생일파티\uD83C\uDF7A회식❤️강남최고의 가성비!",
			"집전체",
			"https://a0.muscache.com/im/pictures/e6bb8c75-de6e-4422-af13-fdbbfbe19a0d.jpg?im_w=720",
			"2022/06/01",
			"2022/06/02",
			new Address("한국", "서울", "서초구", "서초 4동", "비밀"),
			new MemberResponse(1, "우진팍",
				"https://avatars.githubusercontent.com/u/29879110?v=4")
		));
		return reservations;
	}

	public ReservationResponse reservation(long reservationId) {
		return new ReservationResponse(
			reservationId,
			3,
			1488195,
			"♥️2차는 여기! \uD83C\uDF7E생일파티\uD83C\uDF7A회식❤️강남최고의 가성비!",
			"집전체",
			"https://a0.muscache.com/im/pictures/e6bb8c75-de6e-4422-af13-fdbbfbe19a0d.jpg?im_w=720",
			"2022/05/28",
			"2022/05/29",
			new Address("한국", "서울", "서초구", "서초 4동", "비밀"),
			new MemberResponse(1, "우진팍",
				"https://avatars.githubusercontent.com/u/29879110?v=4")
		);
	}
}
