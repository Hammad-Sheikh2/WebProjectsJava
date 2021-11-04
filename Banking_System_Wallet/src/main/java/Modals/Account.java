package Modals;

public class Account {
    public int id;
    public User user;
    public Currency currency;
    public double balance;

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
