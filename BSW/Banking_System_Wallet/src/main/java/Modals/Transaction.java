package Modals;

import Controllers.DatabaseHandler;
import org.sql.Modals.TransactionsEntity;

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

    public Transaction() {
    }
    public Transaction(TransactionsEntity transactionsEntity){
        id=transactionsEntity.getId();
        date=transactionsEntity.getTransDate();
        amount=transactionsEntity.getTransAmount();
        type=transactionsEntity.getTransType();
        accNum=transactionsEntity.getAccountNumber();
        accHolder=transactionsEntity.getAccountHolderName();
        bankName=transactionsEntity.getBankName();
        srcAccount= DatabaseHandler.FindAccountById(transactionsEntity.getTransFromAccId());
        destAccount= (transactionsEntity.getTransToAccId()==-1?new Account():DatabaseHandler.FindAccountById(transactionsEntity.getTransToAccId()));
        if (transactionsEntity.getTransToAccId()==-1)
            destAccount.id=-1;
    }
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
