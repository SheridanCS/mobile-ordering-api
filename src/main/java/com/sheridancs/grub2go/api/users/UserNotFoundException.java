package com.sheridancs.grub2go.api.users;

import java.util.UUID;

class UserNotFoundException extends RuntimeException {
    UserNotFoundException(UUID userId) {
        super(String.format("Could not find user: %s", userId.toString()));
    }

    UserNotFoundException(String username) {
        super(String.format("Could not find user: %s", username));
    }
}
