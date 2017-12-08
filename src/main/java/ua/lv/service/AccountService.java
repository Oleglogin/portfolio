package ua.lv.service;

import ua.lv.entity.Account;

import java.util.List;

/**
 * Created by User on 02.11.2017.
 */
public interface AccountService {
    public void addAccount(Account account);

    public void updateAccount(Account account);

    public void removeAccount(int id);

    public Account getAccountById(int id);

    public List<Account> listAccount();
}
