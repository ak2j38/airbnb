package com.ahoo.airbnb.room.dtos;

import com.ahoo.airbnb.member.MemberResponse;
import com.ahoo.airbnb.room.Address;
import com.ahoo.airbnb.room.Images;
import com.ahoo.airbnb.room.RoomCondition;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RoomDetailResponse {

    private Long roomId;
    private String name;
    private String description;
    private double averageRates;
    private int reviewCount;
    private Address address;
    private MemberResponse host;
    private RoomCondition roomCondition;
    private Integer charge;
    private Images images;
    private Long wishId;
}
