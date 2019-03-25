package com.sheridancs.grub2go.api.orders;

import com.sheridancs.grub2go.api.users.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    public List<Order> findAllByUserIdOrderByDatePlaced(User user);
}
