package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Account;

import java.util.List;

/**
 * Created by User on 03.12.2017.
 */
public interface AccountDAO extends JpaRepository<Account, Integer> {

    @Query("select count (account.id) from Account account where account.user.id=:id")
    int findAllCountAccount(@Param("id") int id);


    @Query("from Account account where account.category=:category")
    List<Account> categoryAccount(@Param("category") String category);

}
