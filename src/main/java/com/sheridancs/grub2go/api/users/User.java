package com.sheridancs.grub2go.api.users;

import lombok.Data;
import lombok.NonNull;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.UUID;

@Data
@Entity
@Table(name = "users")
public class User {
    @Id
    @Type(type = "pg-uuid")
    private UUID id;
    @NonNull private String username;
    @NonNull private String password;
    @Column(length = 100) private String name;
    @Column(length = 100) private String pushToken;

    private Boolean enabled;

    public User() {
        this.id = UUID.randomUUID();
    }
}
