package ua.lv.service;

import ua.lv.entity.Images;

import java.util.List;

/**
 * Created by User on 11.12.2017.
 */
public interface ImagesService {
    void addImages(Images images);
    void removeImages(int id);
    Images getImagesById(int id);
    List<Images> imagesList();
}
