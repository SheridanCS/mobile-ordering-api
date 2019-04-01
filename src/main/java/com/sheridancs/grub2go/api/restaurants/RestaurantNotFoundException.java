package com.sheridancs.grub2go.api.restaurants;

class RestaurantNotFoundException extends RuntimeException {
    RestaurantNotFoundException(Long id) {
        super(String.format("Could not find restaurant: %s", id.toString()));
    }
}
