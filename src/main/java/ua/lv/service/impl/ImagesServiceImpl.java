package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.ImagesDAO;
import ua.lv.entity.Images;
import ua.lv.service.ImagesService;

import java.util.List;

@Service
@Transactional
public class ImagesServiceImpl implements ImagesService {
    @Autowired
    ImagesDAO imagesDAO;

    public void addImages(Images images) {
        imagesDAO.save(images);
    }

    public void removeImages(int id) {
        imagesDAO.delete(id);
    }

    public Images getImagesById(int id) {
        return imagesDAO.findOne(id);
    }

    public List<Images> imagesList() {
        return imagesDAO.findAll();
    }
}
