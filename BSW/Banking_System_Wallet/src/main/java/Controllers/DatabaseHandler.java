package Controllers;

import Modals.Account;
import Modals.Currency;
import Modals.Transaction;
import Modals.User;
import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.sql.HibernateUtill;
import org.sql.Modals.AccountsEntity;
import org.sql.Modals.CurrenciesEntity;
import org.sql.Modals.TransactionsEntity;
import org.sql.Modals.UsersEntity;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DatabaseHandler {
    static Connection getConnection() throws SQLException,ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system_wallet","root","1234");
    }
    public static User validateUser(String username, String password){
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "SELECT * from users where user_name=\""+username+"\" AND user_password=\""+password+"\"";
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(UsersEntity.class);
            List<UsersEntity> results = query.list();
            if(results.size()==0){
                throw new RuntimeException("User Not Found");
            }
            User user =new User(results.get(0));
            return user;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static User FindUserById(int id){
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "SELECT * from users where user_id="+id;
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(UsersEntity.class);
            List<UsersEntity> results = query.list();
            if(results.size()==0){
                throw new RuntimeException("User Not Found");
            }
            User user =new User(results.get(0));
            return user;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static Currency FindCurrencyById(int id){
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "SELECT * from currencies where id="+id;
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(CurrenciesEntity.class);
            List<CurrenciesEntity> results = query.list();
            if(results.size()==0){
                throw new RuntimeException("Currency Not Found");
            }
            Currency currency =new Currency(results.get(0));
            return currency;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static Account FindAccountById(int id){
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "SELECT * from accounts where id="+id;
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(AccountsEntity.class);
            List<AccountsEntity> results = query.list();
            if(results.size()==0){
                throw new RuntimeException("Account Not Found");
            }
            Account account =new Account(results.get(0));
            return account;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static void registerUser(User user){

        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "Insert into users(user_name,user_email,user_national_id,user_contact,user_password,user_address) Values(\""+user.user_name+"\",\""+user.user_email+"\",\""+user.user_national_id+"\",\""+user.user_contact+"\",\""+user.user_password+"\",\""+user.user_address+"\")";
            SQLQuery query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            if(result==0){
                throw new RuntimeException("User Not Registered.");
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Account> GetUserAllAccounts(int userId){
        ArrayList<Account> accounts=new ArrayList<Account>();
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "SELECT * from accounts where user_id="+userId;
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(AccountsEntity.class);
            List<AccountsEntity> results = query.list();
            if(results.size()==0){
                throw new RuntimeException("No account registered in system.");
            }
            for (int i = 0; i < results.size(); i++) {
                accounts.add(new Account(results.get(i)));
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
        return accounts;
    }
    public static ArrayList<Account> GetAllAccounts(){
        ArrayList<Account> accounts=new ArrayList<Account>();
        try {
            Connection connection=getConnection();
            String query="SELECT * from accounts;";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            while (resultSet.next())
            {
                Account account = new Account();
                account.id=resultSet.getInt("id");
                account.balance=resultSet.getDouble("balance");
                account.user=FindUserById(resultSet.getInt("user_id"));
                account.currency=FindCurrencyById(resultSet.getInt("curr_id"));
                accounts.add(account);
            }
            if (accounts.size()==0){
                throw new RuntimeException("No account registered in system.");
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
        return accounts;
    }
    public static void UpdateAccountBalance(Account srcAccount,Account destAccount,double amount){
        try{
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "UPDATE accounts SET balance = balance - "+amount+" WHERE `id` = "+srcAccount.id;
            SQLQuery query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            if(result==0){
                throw new RuntimeException("Source Account Balance Not Updated.");
            }
            if(destAccount.id!=-1){
                double exchangeRate=destAccount.currency.curr_value/ srcAccount.currency.curr_value;
                sql = "UPDATE accounts SET balance = balance + "+amount*exchangeRate+" WHERE `id` = "+destAccount.id;
                query = session.createSQLQuery(sql);
                result = query.executeUpdate();
                if(result==0){
                    throw new RuntimeException("Destination Account Balance Not Updated.");
                }
            }
        }
        catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }
    public static void WithdrawAmount(Transaction transaction){
        try {
            transaction.destAccount.id=-1;
            UpdateAccountBalance(transaction.srcAccount,transaction.destAccount,transaction.amount);
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "Insert into transactions(trans_date,trans_amount,trans_from_acc_id,trans_to_acc_id,trans_type,account_number,account_holder_name,bank_name) " +
                    "Values(\""+new SimpleDateFormat("yyyy-MM-dd H:mm:ss").format(transaction.date)+"\",\""+transaction.amount+"\","+transaction.srcAccount.id+",-1," +
                    "\""+transaction.type+"\",\""+transaction.accNum+"\",\""+transaction.accHolder+"\",\""+transaction.bankName+"\")";
            SQLQuery query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            if(result==0){
                throw new RuntimeException("Transaction Not Added. Withdraw Operation Failed.");
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static void DepositAmount(Transaction transaction){
        try {
            UpdateAccountBalance(transaction.srcAccount,transaction.destAccount,transaction.amount);
            if(transaction.destAccount.id!=-1){
                Session session = HibernateUtill.getFactory().getCurrentSession();
                String sql = "Insert into transactions(trans_date,trans_amount,trans_from_acc_id,trans_to_acc_id,trans_type,account_number,account_holder_name,bank_name) " +
                        "Values(\""+new SimpleDateFormat("yyyy-MM-dd H:mm:ss").format(transaction.date)+"\",\""+transaction.amount+"\","+transaction.srcAccount.id+",-1," +
                        "\""+transaction.type+"\",\""+transaction.accNum+"\",\""+transaction.accHolder+"\",\""+transaction.bankName+"\")";
                SQLQuery query = session.createSQLQuery(sql);
                int result = query.executeUpdate();
                if(result==0){
                    throw new RuntimeException("Transaction Not Added. Deposit Operation Failed.");
                }
            }
            else {
                new HibernateUtill();
                Session session = HibernateUtill.getFactory().getCurrentSession();
                String sql = "Insert into transactions(trans_date,trans_amount,trans_from_acc_id,trans_to_acc_id,trans_type,account_number,account_holder_name,bank_name) " +
                        "Values(\""+new SimpleDateFormat("yyyy-MM-dd H:mm:ss").format(transaction.date)+"\",\""+transaction.amount+"\","+transaction.srcAccount.id+",-1," +
                        "\""+transaction.type+"\",\""+transaction.accNum+"\",\""+transaction.accHolder+"\",\""+transaction.bankName+"\")";
                SQLQuery query = session.createSQLQuery(sql);
                int result = query.executeUpdate();
                if(result==0){
                    throw new RuntimeException("Transaction Not Added. Deposit Operation Failed.");
                }
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Currency> GetAllCurrencies(){
        ArrayList<Currency> currencies=new ArrayList<>();
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "SELECT * from currencies;";
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(CurrenciesEntity.class);
            List<CurrenciesEntity> results = query.list();
            if(results.size()==0){
                throw new RuntimeException("No currency registered in system.");
            }
            for (int i = 0; i < results.size(); i++) {
                currencies.add(new Currency(results.get(i)));
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
        return currencies;
    }
    public static void OpenNewAccount(Account account){
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "Insert into accounts(user_id,curr_id,balance) Values("+account.user.user_id+","+account.currency.id+",0.0)";
            SQLQuery query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            if(result==0){
                throw new RuntimeException("Account Not Registered.");
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Transaction> GetAllTransactionOfSpecificAccountAndInRangeOfDates(int acc_id, Date startDate,Date endDate){
        ArrayList<Transaction> transactions=new ArrayList<>();
        Date temp=new Date(endDate.getTime()+1*24*60*60*1000);
        try {
            new HibernateUtill();
            Session session = HibernateUtill.getFactory().getCurrentSession();
            String sql = "SELECT * from transactions " +
                    "where (trans_from_acc_id="+acc_id+" OR trans_to_acc_id="+acc_id+") " +
                    "AND trans_date between \""+new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"\" and \""+new SimpleDateFormat("yyyy-MM-dd").format(temp)+"\"" +
                    "order by trans_date desc";
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(TransactionsEntity.class);
            List<TransactionsEntity> results = query.list();
            if(results.size()==0){
                return transactions;
            }
            for (int i = 0; i < results.size(); i++) {
                transactions.add(new Transaction(results.get(i)));
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
        return transactions;
    }
    //Extra for Admin
    public static void AddNewCurrency(Currency currency){

    }
    public static void AddUserBalance(double balance){

    }
}
