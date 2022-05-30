package com.ahoo.airbnb.room;

import lombok.Getter;

import java.util.List;

@Getter
public class Images {

    private List<Image> images;

    public Images(List<Image> images) {
        this.images = images;
    }
}
