package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.lv.entity.Category;

/**
 * Created by User on 12.12.2017.
 */
public interface CategoryDAO extends JpaRepository<Category, Integer> {
}
