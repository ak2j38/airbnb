package com.ahoo.airbnb.reservation;

import com.ahoo.airbnb.reservation.dtos.ReservationRequest;
import com.ahoo.airbnb.reservation.dtos.ReservationsResponse;
import com.ahoo.airbnb.reservation.dtos.RoomChargeRequest;
import com.ahoo.airbnb.reservation.dtos.RoomChargeResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/reservations")
@RequiredArgsConstructor
public class ReservationController {

	private final MockReservationService reservationService;

	@PostMapping("/{roomId}/totalCharge")
	public ResponseEntity<RoomChargeResponse> totalChargeOf(
		@PathVariable long roomId,
		@RequestBody RoomChargeRequest roomChargeRequest) {

		log.info("roomChargeRequest={}", roomChargeRequest);
		RoomChargeResponse responseBody = reservationService.calculateTotalChargeOf(roomId, roomChargeRequest);
		return ResponseEntity.ok(responseBody);
	}

	@PostMapping
	public ResponseEntity<Void> reserve(@RequestBody ReservationRequest reservationRequest) {

		log.info("reservationRequest={}", reservationRequest);
		return ResponseEntity.ok().build();
	}

	@GetMapping
	public ResponseEntity<ReservationsResponse> reservations() {
		ReservationsResponse responseBody = reservationService.reservations();
		return ResponseEntity.ok(responseBody);
	}
}
