package com.sheridancs.grub2go.api.restaurants;

import lombok.Data;
import lombok.NonNull;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "items")
class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NonNull private String name;
    private String description;

    @OneToMany
    @JoinTable(
        name = "item_customization",
        joinColumns = {@JoinColumn(name = "item_id")},
        inverseJoinColumns = {@JoinColumn(name = "customization_id")}
    )
    private List<Customization> customizations;

    public Item() {
    }
}
