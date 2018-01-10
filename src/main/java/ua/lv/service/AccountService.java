package ua.lv.service;

import ua.lv.entity.Account;

import java.util.List;

/**
 * Created by User on 02.11.2017.
 */
public interface AccountService {
    void addAccount(Account account);

    void removeAccount(int id);

    Account getAccountById(int id);

    List<Account> listAccount();

    int CountAccount(int id);

    List<Account> categoryAccount(String category);
}
