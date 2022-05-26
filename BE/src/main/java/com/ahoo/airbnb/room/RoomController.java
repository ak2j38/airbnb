package com.ahoo.airbnb.room;

import com.ahoo.airbnb.room.dtos.RoomDetailResponse;
import com.ahoo.airbnb.room.dtos.RoomRequest;
import com.ahoo.airbnb.room.dtos.RoomResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class RoomController {

    private final MockRoomService roomService;

    /**
     * 숙소 리스트
     * @param roomRequest
     * @return
     */
    @PostMapping("/rooms")
    public ResponseEntity<List<RoomResponse>> getRooms(@RequestBody RoomRequest roomRequest) {
        log.info("rooms Post Request : {}", roomRequest);
        return ResponseEntity.ok().body(roomService.findByCondition(roomRequest));
    }

    /**
     * 숙소 상세 정보
     * @param id
     * @return
     */
    @GetMapping("/rooms/{id}")
    public ResponseEntity<RoomDetailResponse> getRoomDetails(@PathVariable Long id) {
        log.info("rooms Get Request : {}", id);
        return ResponseEntity.ok().body(roomService.findById(id));
    }
}
