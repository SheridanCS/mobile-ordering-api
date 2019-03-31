package com.sheridancs.grub2go.api.users;

import lombok.Data;
import lombok.NonNull;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Data
@Entity
@Table(name = "authorities")
public class Authority implements GrantedAuthority {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    @NonNull
    private String name;

    public Authority() {
    }

    public Authority(@NonNull String name) {
        this.name = name;
    }

    @Override
    public String getAuthority() {
        return this.name;
    }
}
