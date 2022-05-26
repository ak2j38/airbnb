package com.ahoo.airbnb.room;

import com.ahoo.airbnb.room.dtos.RoomDetailResponse;
import com.ahoo.airbnb.room.dtos.RoomRequest;
import com.ahoo.airbnb.room.dtos.RoomResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class RoomController {

    private final MockRoomService roomService;

    /**
     * 숙소 리스트
     * @param roomRequest
     * @return
     */
    @PostMapping("/rooms")
    public ResponseEntity<List<RoomResponse>> getRooms(@RequestBody RoomRequest roomRequest) {
         return ResponseEntity.ok().body(roomService.findByCondition(roomRequest));
    }

    @GetMapping("/rooms/{id}")
    public ResponseEntity<RoomDetailResponse> getRoomDetails(@PathVariable Long id) {
        return ResponseEntity.ok().body(roomService.findById(id));
    }
}
