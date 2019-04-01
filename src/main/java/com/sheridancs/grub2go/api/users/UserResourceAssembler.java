package com.sheridancs.grub2go.api.users;

import org.springframework.hateoas.Resource;
import org.springframework.hateoas.ResourceAssembler;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.*;

@Component
public class UserResourceAssembler implements ResourceAssembler<User, Resource<User>> {
    @Override
    public Resource<User> toResource(User user) {
        return new Resource<>(
            user,
            linkTo(methodOn(UserController.class).one(user.getId())).withSelfRel()
        );
    }
}
