package com.ahoo.airbnb.entity;

import com.ahoo.airbnb.reservation.ChargePolicyType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;

@Entity
@Getter
@Table(name = "charge_policy")
public class ChargePolicy {

    @Id
    @GeneratedValue
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "name")
    private ChargePolicyType chargePolicy;

    private boolean isActive;
}
