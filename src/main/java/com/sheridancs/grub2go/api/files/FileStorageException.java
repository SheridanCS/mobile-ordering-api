package com.sheridancs.grub2go.api.files;

class FileStorageException extends RuntimeException {
    FileStorageException(String message) {
        super(message);
    }

    FileStorageException(String message, Throwable cause) {
        super(message, cause);
    }
}
