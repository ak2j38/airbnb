package com.ahoo.airbnb.room.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RoomRequest {

    private String location;
    private String checkInDate;
    private String checkOutDate;
    private int minCharge;
    private int maxCharge;
    private int headCount;
}
