package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.AccountDAO;
import ua.lv.entity.Account;
import ua.lv.service.AccountService;

import java.util.List;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    @Autowired
    AccountDAO accountDAO;

    public void addAccount(Account account) {
        accountDAO.save(account);
    }

    public void updateAccount(Account account) {
        accountDAO.save(account);
    }

    public void removeAccount(int id) {
        accountDAO.delete(id);
    }

    public Account getAccountById(int id) {
        return accountDAO.findOne(id);
    }

    public List<Account> listAccount() {
        return accountDAO.findAll();
    }

}
