package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.RatingDAO;
import ua.lv.entity.Rating;
import ua.lv.service.RatingService;

import java.util.List;

/**
 * Created by User on 03.01.2018.
 */
@Service
@Transactional
public class RatingServiceImpl implements RatingService {
    @Autowired
    RatingDAO ratingDAO;

    public void addRating(Rating rating) {
        ratingDAO.save(rating);
    }

    public int countRating(int id) {
        return ratingDAO.findAllCountRating(id);
    }

    public int sunRating(int id) {
        return ratingDAO.sumAllRating(id);
    }

    public List<Rating> findUsersRating(int id) {
        return ratingDAO.findUsersRating(id);
    }

    public List<Rating> listRating() {
        return ratingDAO.findAll();
    }
}
