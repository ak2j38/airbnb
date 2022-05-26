package com.ahoo.airbnb.room.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RoomResponse {
    private Long roomId;
    private String name;
    private int charge;
    private int totalCharge;
    private double averageRates;
    private int reviewCount;
    private String mainImageUrl;
    private Long wishId;
    private String coordinate;
}
