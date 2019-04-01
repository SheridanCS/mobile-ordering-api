package com.sheridancs.grub2go.security;

import com.sheridancs.grub2go.api.users.User;
import com.sheridancs.grub2go.api.users.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AppUserDetailsService implements UserDetailsService {
    private UserRepository userRepository;

    @Autowired
    public AppUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        List<GrantedAuthority> authorities = new ArrayList<>();
        User user = userRepository.findByUsername(s)
                .orElseThrow(() -> new UsernameNotFoundException(String.format("The username %s doesn't exist", s)));
        user.getAuthorities().forEach(authority -> authorities.add(new SimpleGrantedAuthority(authority.getAuthority())));
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
    }
}
