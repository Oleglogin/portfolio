package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Work;

import java.util.List;

/**
 * Created by User on 03.12.2017.
 */
public interface WorkDAO extends JpaRepository<Work, Integer> {
    @Query("from Work work where work.user.id=:id")
    List<Work> findUserWork(@Param("id") int id);

    @Query("select count(work.id)  from Work work where work.user.id=:userId and work.category=:category")
    int findAllByCategoryIs(@Param("userId") int userId, @Param("category") String category);
    @Query("select count(work.id)  from Work work where  work.category=:category")
    int findAllByCategory(@Param("category") String category);

    @Query("from Work work where work.category=:category")
    List<Work> categoryWorks(@Param("category") String category);
}
