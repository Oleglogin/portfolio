package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.CategoryDAO;
import ua.lv.entity.Category;
import ua.lv.service.CategoryService;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryDAO categoryDAO;

    public void addCategory(Category category) {
        categoryDAO.save(category);
    }

    public void removeCategory(int id) {
        categoryDAO.delete(id);
    }

    public Category getCategoryById(int id) {
        return categoryDAO.findOne(id);
    }

    public List<Category> categorysList() {
        return categoryDAO.findAll();
    }
}
