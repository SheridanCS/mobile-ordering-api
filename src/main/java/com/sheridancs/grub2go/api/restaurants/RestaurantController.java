package com.sheridancs.grub2go.api.restaurants;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping(path = "/api/restaurants")
public class RestaurantController {
    private final RestaurantRepository restaurantRepository;
    private final RestaurantResourceAssembler resourceAssembler;

    @Autowired
    public RestaurantController(RestaurantRepository restaurantRepository, RestaurantResourceAssembler resourceAssembler) {
        this.restaurantRepository = restaurantRepository;
        this.resourceAssembler = resourceAssembler;
    }

    @GetMapping(path = "")
    public Resources<Resource<Restaurant>> all() {
        List<Resource<Restaurant>> restaurants = restaurantRepository.findAll().stream()
                .map(resourceAssembler::toResource)
                .collect(Collectors.toList());

        return new Resources<>(restaurants, linkTo(methodOn(RestaurantController.class).all()).withSelfRel());
    }

    @GetMapping(path = "/{restaurantId}")
    public Resource<Restaurant> one(@PathVariable("restaurantId") Long id) {
        Restaurant restaurant = restaurantRepository.findById(id).orElseThrow(() -> new RestaurantNotFoundException(id));
        return resourceAssembler.toResource(restaurant);
    }


}
