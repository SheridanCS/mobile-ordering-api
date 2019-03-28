package com.sheridancs.grub2go.api.files;

import lombok.Data;

@Data
public class UploadResponse {
    private String name;
    private String uri;
    private String extension;
    private long size;

    public UploadResponse(String name, String uri, String extension, long size) {
        this.name = name;
        this.uri = uri;
        this.extension = extension;
        this.size = size;
    }
}
