package com.ahoo.airbnb.entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;

@Entity
@Getter
@Table(name = "room")
public class Room extends BaseEntity {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "host_id")
    private Member host;

    @Embedded
    private Coordinate coordinate;

    @Embedded
    private Address address;

    private String title;
    private String description;
    private String roomType;
    private int maxCapacity;
    private int bedroomCount;
    private int bedCount;
    private int bathroomCount;
    private int charge;
    private int reviewCount;
    private double averageRate;

    @OneToMany(mappedBy = "room")
    @Column(insertable = false, updatable = false)
    private List<RoomImage> images = new ArrayList<>();

    @OneToMany(mappedBy = "room")
    private List<RoomChargePolicy> roomChargePolicies = new ArrayList<>();
}
