package com.sheridancs.grub2go.api.files;

import lombok.Data;
import lombok.NonNull;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.UUID;

@Data
@Entity
@Table(name = "files")
class File {
    @Id
    @Type(type = "pg-uuid")
    private UUID id;
    @NonNull private String name;
    @NonNull private String extension;
    @Lob
    @Type(type = "org.hibernate.type.BinaryType")
    private byte[] data;

    public File() {}

    File(@NonNull String name, @NonNull String extension, byte[] data) {
        this.id = UUID.randomUUID();
        this.name = name;
        this.extension = extension;
        this.data = data;
    }
}
