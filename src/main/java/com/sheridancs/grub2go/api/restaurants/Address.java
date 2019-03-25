package com.sheridancs.grub2go.api.restaurants;

import lombok.Data;
import lombok.NonNull;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "addresses")
class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NonNull
    private String street;

    @NonNull
    private String city;

    @NonNull
    private String province;

    @NonNull
    @Size(max = 6)
    private String postalCode;

    @NonNull
    private String country;

    private Double latitude;
    private Double longitude;

    public Address() {
    }
}
