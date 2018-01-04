package ua.lv.entity;

import javax.persistence.*;

/**
 * Created by User on 03.01.2018.
 */
@Entity
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int value;
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private Work work;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private User user;

    public Rating() {
    }

    public Rating(int value, Work work) {
        this.value = value;
        this.work = work;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public Work getWork() {
        return work;
    }

    public void setWork(Work work) {
        this.work = work;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
