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

    @OneToOne
    @JoinTable(
        name = "restaurant_address",
        joinColumns = {@JoinColumn(name = "restaurant_id")},
        inverseJoinColumns = {@JoinColumn(name = "address_id")}
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    private Address address;

    @OneToMany
    @JoinTable(
            name = "restaurant_menu",
            joinColumns = {@JoinColumn(name = "restaurant_id")},
            inverseJoinColumns = {@JoinColumn(name = "item_id")}
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Item> items;

    public Restaurant() {
    }
}
