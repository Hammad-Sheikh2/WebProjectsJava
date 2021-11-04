package Modals;

import java.util.Date;

public class Transaction {
    public int id;
    public Date date;
    public double amount;
    public Account srcAccount;
    public Account destAccount;
    public String type;
    public String accNum;
    public String accHolder;
    public String bankName;

    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public double getAmount() {
        return amount;
    }

    public Account getSrcAccount() {
        return srcAccount;
    }

    public Account getDestAccount() {
        return destAccount;
    }

    public String getType() {
        return type;
    }

    public String getAccNum() {
        return accNum;
    }

    public String getAccHolder() {
        return accHolder;
    }

    public String getBankName() {
        return bankName;
    }
}
