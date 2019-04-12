package com.sheridancs.grub2go.api.restaurants;

import lombok.Data;
import lombok.NonNull;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "customizations")
class Customization {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NonNull @Size(max = 100)
    private String name;
    @Size(max = 100) private String description;
    private Double price;

    public Customization() {
    }
}
