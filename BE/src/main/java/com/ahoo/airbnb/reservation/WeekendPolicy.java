package com.ahoo.airbnb.reservation;

public class WeekendPolicy implements ChargePolicy {

    private static WeekendPolicy instance = new WeekendPolicy();

    private WeekendPolicy() {

    }

    public static WeekendPolicy getInstance() {
        return instance;
    }
}
