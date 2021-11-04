package Modals;

import org.sql.Modals.CurrenciesEntity;

public class Currency {
    public int id;
    public String curr_name;
    public String curr_annotation;
    public double curr_value;

    public Currency() {
    }
    public Currency(CurrenciesEntity currenciesEntity){
        id=currenciesEntity.getId();
        curr_name=currenciesEntity.getCurrName();
        curr_annotation=currenciesEntity.getCurrAnnotation();
        curr_value=currenciesEntity.getCurrValue();
    }
    public int getId() {
        return id;
    }

    public String getCurr_name() {
        return curr_name;
    }

    public String getCurr_annotation() {
        return curr_annotation;
    }

    public double getCurr_value() {
        return curr_value;
    }
}
