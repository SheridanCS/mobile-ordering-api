package com.sheridancs.grub2go.api.restaurants;

import lombok.Data;
import lombok.NonNull;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.List;
import java.util.UUID;

@Data
@Entity
@Table(name = "restaurants")
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NonNull
    private String name;

    @Type(type = "pg-uuid")
    private UUID logo;

    @OneToMany
    @JoinTable(
        name = "restaurant_address",
        joinColumns = {@JoinColumn(name = "restaurant_id")},
        inverseJoinColumns = {@JoinColumn(name = "address_id")}
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Address> addresses;

    public Restaurant() {
    }
}
