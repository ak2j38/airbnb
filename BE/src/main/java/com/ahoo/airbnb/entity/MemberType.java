package com.ahoo.airbnb.entity;

public enum MemberType {
    G("게스트"), H("호스트");

    private String role;

    MemberType(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }
}
