package ua.lv.service;

import ua.lv.entity.Rating;

import java.util.List;

/**
 * Created by User on 03.01.2018.
 */
public interface RatingService {
    void addRating(Rating rating);

    int countRating(int id);

    int sunRating(int id);

    List<Rating> findUsersRating(int id);
}
