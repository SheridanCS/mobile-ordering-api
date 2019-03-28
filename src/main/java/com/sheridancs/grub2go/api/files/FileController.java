package com.sheridancs.grub2go.api.files;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.UUID;

@Slf4j
@RestController
@RequestMapping(path = "/api/files")
public class FileController {
    private FileStorageService fileStorageService;

    @Autowired
    public FileController(FileStorageService fileStorageService) {
        this.fileStorageService = fileStorageService;
    }

    @PostMapping(path = "/upload")
    public UploadResponse upload(@RequestParam("file") MultipartFile multipartFile) {
        File file = fileStorageService.upload(multipartFile);
        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/api/files/download/")
                .path(file.getId().toString())
                .toUriString();
        return new UploadResponse(file.getName(), uri, multipartFile.getContentType(), multipartFile.getSize());
    }

    @GetMapping(path = "/download/{id}")
    public ResponseEntity<Resource> download(@PathVariable String id) {
        File file = fileStorageService.retrieve(UUID.fromString(id));
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(file.getExtension()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName() + "\"")
                .body(new ByteArrayResource(file.getData()));
    }
}
