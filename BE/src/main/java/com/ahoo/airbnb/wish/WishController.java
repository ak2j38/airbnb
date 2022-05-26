package com.ahoo.airbnb.wish;

import com.ahoo.airbnb.room.dtos.RoomResponse;
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

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/wish")
public class WishController {

    private final MockWishService wishService;

    @GetMapping
    public ResponseEntity<List<RoomResponse>> getWishes() {

        log.info("getWishes");
        return ResponseEntity.ok().body(wishService.findAll());
    }

    @PostMapping("/{roomId}")
    public ResponseEntity<Void> create(@PathVariable Long roomId, @RequestParam Long wishId) {

        log.info("create roomId={}, wishId={}", roomId, wishId);
        wishService.registration(wishId, roomId);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{wishId}")
    public ResponseEntity<Void> delete(@PathVariable Long wishId) {

        log.info("delete={}", wishId);
        wishService.deleteById(wishId);
        return ResponseEntity.noContent().build();
    }
}
