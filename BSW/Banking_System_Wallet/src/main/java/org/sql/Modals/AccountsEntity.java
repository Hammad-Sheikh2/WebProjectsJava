package org.sql.Modals;

import javax.persistence.*;

@Entity
@Table(name = "accounts", schema = "banking_system_wallet", catalog = "")
public class AccountsEntity {
    private int id;
    private int userId;
    private int currId;
    private double balance;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "curr_id", nullable = false)
    public int getCurrId() {
        return currId;
    }

    public void setCurrId(int currId) {
        this.currId = currId;
    }

    @Basic
    @Column(name = "balance", nullable = false, precision = 0)
    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AccountsEntity that = (AccountsEntity) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (currId != that.currId) return false;
        if (Double.compare(that.balance, balance) != 0) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + userId;
        result = 31 * result + currId;
        temp = Double.doubleToLongBits(balance);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
