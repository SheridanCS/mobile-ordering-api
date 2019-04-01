package com.sheridancs.grub2go.api.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.provider.endpoint.TokenEndpoint;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

@RestController
@RequestMapping(path = "/api/users")
public class UserController {
    private final UserRepository userRepository;
    private final UserResourceAssembler resourceAssembler;
    private TokenEndpoint tokenEndpoint;
    private TokenStore tokenStore;

    @Autowired
    public UserController(UserRepository userRepository, UserResourceAssembler resourceAssembler, TokenEndpoint tokenEndpoint, TokenStore tokenStore) {
        this.userRepository = userRepository;
        this.resourceAssembler = resourceAssembler;
        this.tokenEndpoint = tokenEndpoint;
        this.tokenStore = tokenStore;
    }

    @GetMapping(path = "")
    @PreAuthorize("hasAuthority('ROLE_SUPERUSER')")
    public Resources<Resource<User>> all() {
        List<Resource<User>> users = userRepository.findAll().stream()
                .map(resourceAssembler::toResource)
                .collect(Collectors.toList());

        return new Resources<>(users, linkTo(methodOn(UserController.class).all()).withSelfRel());
    }

    @PostMapping(path = "/register")
    public ResponseEntity<?> registerUser(@RequestBody User user) throws URISyntaxException {
        Resource<User> resource = resourceAssembler.toResource(userRepository.save(user));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    @GetMapping(path = "/{userId}")
    public Resource<User> one(@PathVariable UUID userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new UserNotFoundException(userId));
        return resourceAssembler.toResource(user);
    }

    @PutMapping(path = "/{userId}")
    public ResponseEntity<?> updateUser(@RequestBody User newUser, @PathVariable UUID userId) throws URISyntaxException {
        User updatedUser = userRepository.findById(userId).map(
            user -> {
                user.setUsername(newUser.getUsername());
                user.setPassword(newUser.getPassword());
                user.setName(newUser.getName());
                user.setAvatar(newUser.getAvatar());
                user.setPushToken(newUser.getPushToken());
                user.setEnabled(newUser.getEnabled());
                return userRepository.save(user);
            }
        ).orElseGet(() -> {
            newUser.setId(userId);
            return userRepository.save(newUser);
        });

        Resource<User> resource = resourceAssembler.toResource(updatedUser);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    @DeleteMapping(path = "/{userId}")
    ResponseEntity<?> deleteUser(@PathVariable UUID userId) {
        userRepository.deleteById(userId);
        return ResponseEntity.noContent().build();
    }
}
