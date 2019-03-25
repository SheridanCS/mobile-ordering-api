package com.sheridancs.grub2go.api.restaurants;

import lombok.Data;
import lombok.NonNull;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "restaurants")
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NonNull
    private String name;

    @OneToMany
    @JoinTable(
        name = "restaurant_address",
        joinColumns = {@JoinColumn(name = "restaurant_id")},
        inverseJoinColumns = {@JoinColumn(name = "address_id")}
    )
    private List<Address> addresses;

    @OneToMany
    @JoinTable(
        name = "restaurant_menu",
        joinColumns = {@JoinColumn(name = "restaurant_id")},
        inverseJoinColumns = {@JoinColumn(name = "item_id")}
    )
    private List<Item> items;

    public Restaurant() {
    }
}
