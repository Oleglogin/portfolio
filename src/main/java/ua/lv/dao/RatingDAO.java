package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Rating;

import java.util.List;

/**
 * Created by User on 03.01.2018.
 */
public interface RatingDAO extends JpaRepository<Rating,Integer> {

    @Query("select count (rating.id) from Rating rating where rating.work.id=:id")
    int findAllCountRating(@Param("id") int id);

    @Query("select sum (rating.value) from Rating rating where rating.work.id=:id")
    int sumAllRating(@Param("id") int id);

    @Query("from Rating rating where rating.work.id=:id")
    List<Rating> findUsersRating(@Param("id")int id);
}
