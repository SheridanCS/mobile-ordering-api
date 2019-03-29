package com.sheridancs.grub2go.api.files;

import lombok.Data;

@Data
class UploadResponse {
    private String name;
    private String id;
    private String extension;
    private long size;

    UploadResponse(String name, String id, String extension, long size) {
        this.name = name;
        this.id = id;
        this.extension = extension;
        this.size = size;
    }
}
