package com.sheridancs.grub2go.api.users;

import lombok.Data;
import lombok.NonNull;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.UUID;

@Data
@Entity
@Table(name = "users")
public class User implements UserDetails {
    @Id
    @Type(type = "pg-uuid")
    private UUID id;
    @NonNull private String email;
    @NonNull private String username;
    @NonNull private String password;
    @Column(length = 100) private String name;
    @Type(type = "pg-uuid") private UUID avatar;
    @Column(length = 100) private String pushToken;
    private Boolean enabled = true;
    private Boolean credentialsExpired = false;
    @ManyToMany
    @JoinTable(
        name = "user_authorities",
        joinColumns = {@JoinColumn(name = "user_id")},
        inverseJoinColumns = {@JoinColumn(name = "authority_id")}
    )
    @Fetch(value = FetchMode.JOIN)
    private Collection<Authority> authorities;

    public User() {
        this.id = UUID.randomUUID();
    }

    public User(@NonNull String email, @NonNull String username, @NonNull String password, String name) {
        this.id = UUID.randomUUID();
        this.email = email;
        this.username = username;
        this.password = password;
        this.name = name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return !this.credentialsExpired;
    }

    @Override
    public boolean isEnabled() {
        return this.enabled;
    }
}
