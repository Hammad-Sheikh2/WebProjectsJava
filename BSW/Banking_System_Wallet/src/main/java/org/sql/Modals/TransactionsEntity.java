package org.sql.Modals;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "transactions", schema = "banking_system_wallet", catalog = "")
public class TransactionsEntity {
    private int id;
    private Timestamp transDate;
    private double transAmount;
    private int transFromAccId;
    private int transToAccId;
    private String transType;
    private String accountNumber;
    private String accountHolderName;
    private String bankName;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "trans_date", nullable = false)
    public Timestamp getTransDate() {
        return transDate;
    }

    public void setTransDate(Timestamp transDate) {
        this.transDate = transDate;
    }

    @Basic
    @Column(name = "trans_amount", nullable = false, precision = 0)
    public double getTransAmount() {
        return transAmount;
    }

    public void setTransAmount(double transAmount) {
        this.transAmount = transAmount;
    }

    @Basic
    @Column(name = "trans_from_acc_id", nullable = false)
    public int getTransFromAccId() {
        return transFromAccId;
    }

    public void setTransFromAccId(int transFromAccId) {
        this.transFromAccId = transFromAccId;
    }

    @Basic
    @Column(name = "trans_to_acc_id", nullable = false)
    public int getTransToAccId() {
        return transToAccId;
    }

    public void setTransToAccId(int transToAccId) {
        this.transToAccId = transToAccId;
    }

    @Basic
    @Column(name = "trans_type", nullable = false, length = 45)
    public String getTransType() {
        return transType;
    }

    public void setTransType(String transType) {
        this.transType = transType;
    }

    @Basic
    @Column(name = "account_number", nullable = true, length = 255)
    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    @Basic
    @Column(name = "account_holder_name", nullable = true, length = 255)
    public String getAccountHolderName() {
        return accountHolderName;
    }

    public void setAccountHolderName(String accountHolderName) {
        this.accountHolderName = accountHolderName;
    }

    @Basic
    @Column(name = "bank_name", nullable = true, length = 255)
    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TransactionsEntity that = (TransactionsEntity) o;

        if (id != that.id) return false;
        if (Double.compare(that.transAmount, transAmount) != 0) return false;
        if (transFromAccId != that.transFromAccId) return false;
        if (transToAccId != that.transToAccId) return false;
        if (transDate != null ? !transDate.equals(that.transDate) : that.transDate != null) return false;
        if (transType != null ? !transType.equals(that.transType) : that.transType != null) return false;
        if (accountNumber != null ? !accountNumber.equals(that.accountNumber) : that.accountNumber != null)
            return false;
        if (accountHolderName != null ? !accountHolderName.equals(that.accountHolderName) : that.accountHolderName != null)
            return false;
        if (bankName != null ? !bankName.equals(that.bankName) : that.bankName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + (transDate != null ? transDate.hashCode() : 0);
        temp = Double.doubleToLongBits(transAmount);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + transFromAccId;
        result = 31 * result + transToAccId;
        result = 31 * result + (transType != null ? transType.hashCode() : 0);
        result = 31 * result + (accountNumber != null ? accountNumber.hashCode() : 0);
        result = 31 * result + (accountHolderName != null ? accountHolderName.hashCode() : 0);
        result = 31 * result + (bankName != null ? bankName.hashCode() : 0);
        return result;
    }
}
