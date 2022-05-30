package com.ahoo.airbnb.room;

import com.ahoo.airbnb.room.dtos.RoomDetailResponse;
import com.ahoo.airbnb.room.dtos.RoomRequest;
import com.ahoo.airbnb.room.dtos.RoomResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "rooms", description = "숙소 API")
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class RoomController {

    private final MockRoomService roomService;

    @Operation(summary = "숙소 리스트 조회",
        description = "모든 숙소를 조회합니다.",
        responses = {
            @ApiResponse(responseCode = "200",
                description = "숙소 리스트 조회 성공",
                content = {
                    @Content(
                        mediaType = "application/json",
                        array = @ArraySchema(schema = @Schema(implementation = RoomResponse.class))
                    )
                })
        }
    )
    @PostMapping("/rooms")
    public ResponseEntity<List<RoomResponse>> getRooms(@RequestBody RoomRequest roomRequest) {

        log.info("rooms Post Request : {}", roomRequest);
        return ResponseEntity.ok().body(roomService.findByCondition(roomRequest));
    }

    @Operation(summary = "숙소 상세 조회",
        description = "숙소의 상세 정보 및 이미지를 조회합니다.",
        responses = {
            @ApiResponse(responseCode = "200",
                description = "숙소 상세 조회 성공",
                content = {
                    @Content(
                        mediaType = "application/json",
                        schema = @Schema(implementation = RoomDetailResponse.class)
                    )
                })
        }
    )
    @GetMapping("/rooms/{id}")
    public ResponseEntity<RoomDetailResponse> getRoomDetails(@PathVariable Long id) {

        log.info("rooms Get Request : {}", id);
        return ResponseEntity.ok().body(roomService.findById(id));
    }
}
