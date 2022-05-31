package com.ahoo.airbnb.reservation.chargepolicy;

import com.ahoo.airbnb.entity.Room;
import com.ahoo.airbnb.utils.DateUtils;
import java.time.LocalDateTime;

public class WeeklyDiscountChargePolicy implements ChargePolicy {

    private static final WeeklyDiscountChargePolicy instance = new WeeklyDiscountChargePolicy();

    private final int dayCountOfWeek = 7;
    private final double calculateRatio = -0.04;

    private WeeklyDiscountChargePolicy() {

    }

    public static WeeklyDiscountChargePolicy getInstance() {
        return instance;
    }

    private int calculateWeekCount(LocalDateTime checkIn, LocalDateTime checkOut) {
        return DateUtils.getBetweenDays(checkIn, checkOut) / dayCountOfWeek;
    }

    @Override
    public double calculate(LocalDateTime checkIn, LocalDateTime checkOut, int headcount,
        Room room) {
        return room.getCharge() * calculateRatio * calculateWeekCount(checkIn, checkOut);
    }
}
