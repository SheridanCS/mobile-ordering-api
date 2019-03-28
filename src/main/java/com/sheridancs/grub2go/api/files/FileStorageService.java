package com.sheridancs.grub2go.api.files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

@Service
public class FileStorageService {
    private FileRepository fileRepository;

    @Autowired
    public FileStorageService(FileRepository fileRepository) {
        this.fileRepository = fileRepository;
    }

    File upload(MultipartFile file) {
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            if (fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            File dbFile = new File(fileName, file.getContentType(), file.getBytes());

            return fileRepository.save(dbFile);
        } catch (IOException e) {
            throw new FileStorageException("Could not store file: " + fileName, e);
        }
    }

    File retrieve(UUID name) {
        return fileRepository.findById(name)
                .orElseThrow(() -> new FileNotFoundException("File not found with ID: " + name));
    }
}
