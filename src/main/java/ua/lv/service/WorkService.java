package ua.lv.service;

import ua.lv.entity.Work;

import java.util.List;

public interface WorkService {
    void addWork(Work work);
    void removeWork(int id);
    Work getWorkById(int id);
    List<Work> workList();
    List<Work> userWork(int id);
    List<Work> workCategory(String category);


    int findAllByCategoryIs(int userId, String category);
    int findAllByCategory(String category);


}
