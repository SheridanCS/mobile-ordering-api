package com.sheridancs.grub2go.api.orders;

import com.sheridancs.grub2go.api.restaurants.Restaurant;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import com.sheridancs.grub2go.api.users.User;

@Data
@Entity
@Table(name = "orders")
class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private User user;
    @ManyToOne
    private Restaurant restaurant;

    @Temporal(value = TemporalType.DATE)
    private Date datePlaced;

    private Short status;

    public Order() {
    }
}
