package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.WorkDAO;
import ua.lv.entity.Work;
import ua.lv.service.WorkService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by User on 08.12.2017.
 */
@Service
@Transactional
public class WorkServiceImpl implements WorkService {

    @Autowired
    WorkDAO workDAO;

    public void addWork(Work work) {
        workDAO.save(work);
    }


    public void removeWork(int id) {
        workDAO.delete(id);
    }

    public Work getWorkById(int id) {
        return workDAO.findOne(id);
    }

    public List<Work> workList() {
        return workDAO.findAll();
    }

    public List<Work> userWork(int id) {
        return workDAO.findUserWork(id);
    }

    public List<Work> workCategory(String category) {
        return workDAO.categoryWorks(category);
    }


    public int findAllByCategoryIs(int userId, String category) {
        return workDAO.findAllByCategoryIs(userId,category);
    }

    public int findAllByCategory(String category) {
        return workDAO.findAllByCategory(category);
    }

    public int findAllWorks() {
        return workDAO.Allworks();
    }

    @Override
    public List<Work> sortList() {
        ArrayList<Work> sortList = new ArrayList<>();
        sortList.addAll(workDAO.findAll());
        sortList.sort((o1, o2) -> {
            if (o1.getId() == o2.getId()) {
                return 0;
            } else if (o1.getId() < o2.getId()) {
                return 1;
            } else return -1;
        });
        return sortList;
    }

    @Override
    public List<Work> sortListDate() {
        ArrayList<Work> sortList = new ArrayList<>();
        sortList.addAll(workDAO.findAll());

        return null;
    }
}
