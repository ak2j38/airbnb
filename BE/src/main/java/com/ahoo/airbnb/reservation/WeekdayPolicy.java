package com.ahoo.airbnb.reservation;


public class WeekdayPolicy implements ChargePolicy {

    private static WeekdayPolicy instance = new WeekdayPolicy();

    private WeekdayPolicy() {

    }

    public static WeekdayPolicy getInstance() {
        return instance;
    }
}
