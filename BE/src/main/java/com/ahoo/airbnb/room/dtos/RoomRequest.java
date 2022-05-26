package com.ahoo.airbnb.room.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RoomRequest {
    private String location;
    private String checkInDate;
    private String checkOutDate;
    private int minCharge;
    private int maxCharge;
    private int headCount;
}
