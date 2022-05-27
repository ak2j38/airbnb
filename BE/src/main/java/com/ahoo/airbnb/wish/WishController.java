package com.ahoo.airbnb.wish;

import com.ahoo.airbnb.room.dtos.RoomResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "wishes", description = "위시 API")
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/wish")
public class WishController {

    private final MockWishService wishService;

    @Operation(summary = "위시 리스트 조회",
        description = "모든 위시를 조회합니다.",
        responses = {
            @ApiResponse(responseCode = "200",
                description = "위시 리스트 조회 성공",
                content = {
                    @Content(
                        mediaType = "application/json",
                        array = @ArraySchema(schema = @Schema(implementation = RoomResponse.class))
                    )
                })
        }
    )
    @GetMapping
    public ResponseEntity<List<RoomResponse>> getWishes() {

        log.info("getWishes");
        return ResponseEntity.ok().body(wishService.findAll());
    }

    @Operation(summary = "위시 등록",
        description = "위시리스트에 등록합니다.",
        responses = {
            @ApiResponse(responseCode = "204",
                description = "위시 등록 성공"
            )
        }
    )
    @PostMapping("/{roomId}")
    public ResponseEntity<Void> create(@PathVariable Long roomId, @RequestParam Long wishId) {

        log.info("create roomId={}, wishId={}", roomId, wishId);
        wishService.registration(wishId, roomId);
        return ResponseEntity.noContent().build();
    }

    @Operation(summary = "위시 삭제",
        description = "위시리스트에서 삭제합니다.",
        responses = {
            @ApiResponse(responseCode = "204",
                description = "위시 삭제 성공"
            )
        }
    )
    @DeleteMapping("/{wishId}")
    public ResponseEntity<Void> delete(@PathVariable Long wishId) {

        log.info("delete={}", wishId);
        wishService.deleteById(wishId);
        return ResponseEntity.noContent().build();
    }
}
