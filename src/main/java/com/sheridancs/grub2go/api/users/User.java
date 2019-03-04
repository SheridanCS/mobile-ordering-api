package com.sheridancs.grub2go.api.users;

import lombok.Data;
import org.hibernate.annotations.Type;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.UUID;

@Data
@Entity
public class User {
    @Id
    @Type(type = "pg-uuid")
    private UUID id;
    private String username;
    private String password;

    private User() {}
    public User(String username, String password) {
        this.id = java.util.UUID.randomUUID();
        this.username = username;
        this.password = password;
    }
}
