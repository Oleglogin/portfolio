package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.lv.entity.Images;

/**
 * Created by User on 11.12.2017.
 */
public interface ImagesDAO extends JpaRepository<Images, Integer> {
}
