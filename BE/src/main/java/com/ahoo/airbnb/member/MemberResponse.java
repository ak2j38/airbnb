package com.ahoo.airbnb.member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberResponse {

    private Long id;
    private String name;
    private String profileImageUrl;
}
