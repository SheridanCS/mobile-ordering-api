package com.sheridancs.grub2go.api.restaurants;

import org.springframework.hateoas.Resource;
import org.springframework.hateoas.ResourceAssembler;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

@Component
public class RestaurantResourceAssembler implements ResourceAssembler<Restaurant, Resource<Restaurant>> {
    @Override
    public Resource<Restaurant> toResource(Restaurant restaurant) {
        return new Resource<>(
            restaurant,
            linkTo(methodOn(RestaurantController.class).one(restaurant.getId())).withSelfRel(),
            linkTo(methodOn(RestaurantController.class).all()).withRel("restaurants")/*,
            linkTo(methodOn(RestaurantController.class).menu(restaurant.getId())).withSelfRel().withRel("menu")*/
        );
    }
}
