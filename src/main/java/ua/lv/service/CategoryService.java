package ua.lv.service;

import ua.lv.entity.Category;

import java.util.List;

/**
 * Created by User on 12.12.2017.
 */
public interface CategoryService {
    void addCategory(Category category);
    void removeCategory(int id);
    Category getCategoryById(int id);
    List<Category> categorysList();
}
