package com.ahoo.airbnb.room;

import com.ahoo.airbnb.member.MemberResponse;
import com.ahoo.airbnb.room.dtos.RoomDetailResponse;
import com.ahoo.airbnb.room.dtos.RoomRequest;
import com.ahoo.airbnb.room.dtos.RoomResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MockRoomService {

    public List<RoomResponse> findByCondition(RoomRequest roomRequest) {
        log.info("findByCondition : {}", roomRequest);
        return List.of(
                new RoomResponse(1L, "RoziHouse #건대입구역2분#소독#넷플릭스#커먼그라운드#CGV#한강", 75_000, 1_200_000, 4.7, 127, "https://a0.muscache.com/im/pictures/f033e5ee-ae6f-48c2-9196-996444f16c4a.jpg?im_w=1200", 1L, "41.40338, 2.17403"),
                new RoomResponse(2L, "도시속영화관 #2 빔프로젝트, 왕십리역1분, 한양대병원 .시티뷰, 넷플릭스", 60_000, 1_000_539, 4.5, 95, "https://a0.muscache.com/im/pictures/miso/Hosting-47988590/original/12c9f003-22bf-4df0-8ea0-1ca8a5569f6c.jpeg?im_w=1200", 2L, "41.40990, 2.15235"),
                new RoomResponse(3L, "그레이하우스 서울대입구 5분거리 샤로수길 맞은편 #강남 #홍대 #2호선 #GrayHouse", 60_000, 1_000_539, 4.5, 95, "https://a0.muscache.com/im/pictures/f71636a9-1091-40c3-bea7-0d1ae6794428.jpg?im_w=1200", null, "25.40990, 4.15235")

        );
    }

    public RoomDetailResponse findById(Long id) {
        log.info("findById : {}", id);
        return new RoomDetailResponse(1L,
                "RoziHouse #건대입구역2분#소독#넷플릭스#커먼그라운드#CGV#한강",
                "Welcome to the purply purple Rozi house. It's gonna be a special and cozy day in here.",
                4.7,
                127,
                new Address(),
                new MemberResponse(),
                new RoomCondition(),
                75_000,
                new Images(List.of(
                        new Image(1, "https://a0.muscache.com/im/pictures/f033e5ee-ae6f-48c2-9196-996444f16c4a.jpg?im_w=1200"),
                        new Image(2, "https://a0.muscache.com/im/pictures/b69572aa-c59d-4157-a190-1718a8f664cf.jpg?im_w=720"),
                        new Image(3, "https://a0.muscache.com/im/pictures/9dc70b7f-8011-4824-97db-23341bb12750.jpg?im_w=720"),
                        new Image(4, "https://a0.muscache.com/im/pictures/2e96ffff-336c-4495-a2ea-bd18780bfdbf.jpg?im_w=720"),
                        new Image(5, "https://a0.muscache.com/im/pictures/e0c1bbf3-50a1-4095-920c-7440af2ded1e.jpg?im_w=720")
                        )),
                1L);
    }
}
