package org.sql.Modals;

import javax.persistence.*;

@Entity
@Table(name = "currencies", schema = "banking_system_wallet", catalog = "")
public class CurrenciesEntity {
    private int id;
    private String currName;
    private String currAnnotation;
    private double currValue;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "curr_name", nullable = false, length = 255)
    public String getCurrName() {
        return currName;
    }

    public void setCurrName(String currName) {
        this.currName = currName;
    }

    @Basic
    @Column(name = "curr_annotation", nullable = false, length = 45)
    public String getCurrAnnotation() {
        return currAnnotation;
    }

    public void setCurrAnnotation(String currAnnotation) {
        this.currAnnotation = currAnnotation;
    }

    @Basic
    @Column(name = "curr_value", nullable = false, precision = 0)
    public double getCurrValue() {
        return currValue;
    }

    public void setCurrValue(double currValue) {
        this.currValue = currValue;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CurrenciesEntity that = (CurrenciesEntity) o;

        if (id != that.id) return false;
        if (Double.compare(that.currValue, currValue) != 0) return false;
        if (currName != null ? !currName.equals(that.currName) : that.currName != null) return false;
        if (currAnnotation != null ? !currAnnotation.equals(that.currAnnotation) : that.currAnnotation != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + (currName != null ? currName.hashCode() : 0);
        result = 31 * result + (currAnnotation != null ? currAnnotation.hashCode() : 0);
        temp = Double.doubleToLongBits(currValue);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
