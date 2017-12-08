package ua.lv.entity;

import javax.persistence.*;

@Entity
public class Work {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String workImg;
    private String workName;
    private String category;
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private User user;

    public Work() {
    }

    public Work(String workImg, String workName, String category) {
        this.workImg = workImg;
        this.workName = workName;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWorkImg() {
        return workImg;
    }

    public void setWorkImg(String workImg) {
        this.workImg = workImg;
    }

    public String getWorkName() {
        return workName;
    }

    public void setWorkName(String workName) {
        this.workName = workName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
