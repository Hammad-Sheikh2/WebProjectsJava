package Modals;

import Controllers.DatabaseHandler;
import org.sql.Modals.AccountsEntity;

public class Account {
    public int id;
    public User user;
    public Currency currency;
    public double balance;

    public Account() {
    }

    public Account(AccountsEntity accountsEntity){
        id=accountsEntity.getId();
        user= DatabaseHandler.FindUserById(accountsEntity.getUserId());
        currency=DatabaseHandler.FindCurrencyById(accountsEntity.getCurrId());
        balance=accountsEntity.getBalance();
    }

    public int getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public Currency getCurrency() {
        return currency;
    }

    public double getBalance() {
        return balance;
    }
}
