package com.ahoo.airbnb.reservation.dtos;

import com.ahoo.airbnb.member.MemberResponse;
import com.ahoo.airbnb.room.Address;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ReservationResponse {

	private long reservationID;
	private int headCount;
	private int totalCharge;
	private String roomName;
	private String roomType;
	private String mainImageUrl;
	private String checkInDate;
	private String checkOutDate;
	private Address address;
	private MemberResponse host;
}
