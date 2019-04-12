package com.sheridancs.grub2go.api.restaurants;

import lombok.Data;
import lombok.NonNull;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

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
    private Double price;

    @OneToMany
    @JoinTable(
        name = "item_customization",
        joinColumns = {@JoinColumn(name = "item_id")},
        inverseJoinColumns = {@JoinColumn(name = "customization_id")}
    )

    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Customization> customizations;

    public Item() {
    }
}
