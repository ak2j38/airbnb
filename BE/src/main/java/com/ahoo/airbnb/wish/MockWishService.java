package com.ahoo.airbnb.wish;

import com.ahoo.airbnb.room.dtos.RoomResponse;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class MockWishService {

    public List<RoomResponse> findAll() {

        return List.of(
            new RoomResponse(1L, "RoziHouse #건대입구역2분#소독#넷플릭스#커먼그라운드#CGV#한강", 75_000, 1_200_000, 4.7,
                127,
                "https://a0.muscache.com/im/pictures/f033e5ee-ae6f-48c2-9196-996444f16c4a.jpg?im_w=1200",
                1L, "41.40338, 2.17403"),
            new RoomResponse(2L, "도시속영화관 #2 빔프로젝트, 왕십리역1분, 한양대병원 .시티뷰, 넷플릭스", 60_000, 1_000_539,
                4.51, 95,
                "https://a0.muscache.com/im/pictures/miso/Hosting-47988590/original/12c9f003-22bf-4df0-8ea0-1ca8a5569f6c.jpeg?im_w=1200",
                2L, "41.40990, 2.15235"),
            new RoomResponse(3L, "그레이하우스 서울대입구 5분거리 샤로수길 맞은편 #강남 #홍대 #2호선 #GrayHouse", 60_000,
                60_539, 3.52, 50,
                "https://a0.muscache.com/im/pictures/f71636a9-1091-40c3-bea7-0d1ae6794428.jpg?im_w=1200",
                3L, "25.40990, 4.15235")

        );
    }

    public void registration(Long wishId, Long roomId) {
        // 추후 실제 서비스 코드에서 구현 예정
    }

    public void deleteById(Long wishId) {
        // 추후 실제 서비스 코드에서 구현 예정
    }
}
