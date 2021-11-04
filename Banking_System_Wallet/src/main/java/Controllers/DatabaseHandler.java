package Controllers;

import Modals.Account;
import Modals.Currency;
import Modals.Transaction;
import Modals.User;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class DatabaseHandler {
    static Connection getConnection() throws SQLException,ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system_wallet","root","1234");
    }
    public static User validateUser(String username, String password){
        try {
            Connection connection=getConnection();
            String query="SELECT * from users where user_name=\""+username+"\" AND user_password=\""+password+"\"";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            User user = null;
            while (resultSet.next())
            {
                user=new User();
                user.user_id=resultSet.getInt("user_id");
                user.user_name=resultSet.getString("user_name");
                user.user_email=resultSet.getString("user_email");
                user.user_national_id=resultSet.getString("user_national_id");
                user.user_contact=resultSet.getString("user_contact");
                user.user_password=resultSet.getString("user_password");
                user.user_address=resultSet.getString("user_address");
            }
            if (user == null){
                throw new Exception();
            }
            return user;
        }
        catch (Exception e)
        {
            throw new RuntimeException("User Not Found");
        }
    }
    public static User FindUserById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from users where user_id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            User user = null;
            while (resultSet.next())
            {
                user=new User();
                user.user_id=resultSet.getInt("user_id");
                user.user_name=resultSet.getString("user_name");
                user.user_email=resultSet.getString("user_email");
                user.user_national_id=resultSet.getString("user_national_id");
                user.user_contact=resultSet.getString("user_contact");
                user.user_password=resultSet.getString("user_password");
                user.user_address=resultSet.getString("user_address");
            }
            if (user == null){
                throw new RuntimeException("User Not Found.");
            }
            return user;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static Currency FindCurrencyById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from currencies where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            Currency currency = null;
            while (resultSet.next())
            {
                currency=new Currency();
                currency.id=resultSet.getInt("id");
                currency.curr_name=resultSet.getString("curr_name");
                currency.curr_annotation=resultSet.getString("curr_annotation");
                currency.curr_value=resultSet.getDouble("curr_value");
            }
            if (currency == null){
                throw new RuntimeException("Currency Not Found");
            }
            return currency;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static Account FindAccountById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from accounts where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            Account account = null;
            while (resultSet.next())
            {
                account = new Account();
                account.id=resultSet.getInt("id");
                account.balance=resultSet.getDouble("balance");
                account.user=FindUserById(resultSet.getInt("user_id"));
                account.currency=FindCurrencyById(resultSet.getInt("curr_id"));
            }
            if (account == null){
                throw new RuntimeException("Account Not Found");
            }
            return account;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static void registerUser(User user){

        try {
            Connection connection=getConnection();
            String query="Insert into users(user_name,user_email,user_national_id,user_contact,user_password,user_address) Values(\""+user.user_name+"\",\""+user.user_email+"\",\""+user.user_national_id+"\",\""+user.user_contact+"\",\""+user.user_password+"\",\""+user.user_address+"\")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new RuntimeException("User Registration Failed.");
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Account> GetUserAllAccounts(int userId){
        ArrayList<Account> accounts=new ArrayList<Account>();
        try {
            Connection connection=getConnection();
            String query="SELECT * from accounts where user_id="+userId;
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
                throw new RuntimeException("User has no open account in system. Go to accounts section and open a new account.");
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
            Connection connection=getConnection();
            String query="UPDATE accounts SET balance = balance - "+amount+" WHERE `id` = "+srcAccount.id;
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if((rowsAffected==0))
                throw new RuntimeException("Source Account Balance Not Updated.");
            if(destAccount.id!=-1){
                double exchangeRate=destAccount.currency.curr_value/ srcAccount.currency.curr_value;
                query="UPDATE accounts SET balance = balance + "+amount*exchangeRate+" WHERE `id` = "+destAccount.id;
                rowsAffected=statement.executeUpdate(query);
                if((rowsAffected==0))
                    throw new RuntimeException("Destination Account Balance Not Updated.");
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
            Connection connection=getConnection();
            String query="Insert into transactions(trans_date,trans_amount,trans_from_acc_id,trans_to_acc_id,trans_type,account_number,account_holder_name,bank_name) " +
                    "Values(\""+new SimpleDateFormat("yyyy-MM-dd H:mm:ss").format(transaction.date)+"\",\""+transaction.amount+"\","+transaction.srcAccount.id+",-1," +
                    "\""+transaction.type+"\",\""+transaction.accNum+"\",\""+transaction.accHolder+"\",\""+transaction.bankName+"\")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new RuntimeException("Transaction Not Added. Withdraw Operation Failed.");
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static void DepositAmount(Transaction transaction){
        try {
            UpdateAccountBalance(transaction.srcAccount,transaction.destAccount,transaction.amount);
            Connection connection=getConnection();
            String query="Insert into transactions(trans_date,trans_amount,trans_from_acc_id,trans_to_acc_id,trans_type,account_number,account_holder_name,bank_name) " +
                    "Values(\""+new SimpleDateFormat("yyyy-MM-dd H:mm:ss").format(transaction.date)+"\",\""+transaction.amount+"\","+transaction.srcAccount.id+",-1," +
                    "\""+transaction.type+"\",\""+transaction.accNum+"\",\""+transaction.accHolder+"\",\""+transaction.bankName+"\")";
            if(transaction.destAccount.id!=-1){
                query="Insert into transactions(trans_date,trans_amount,trans_from_acc_id,trans_to_acc_id,trans_type) " +
                        "Values(\""+new SimpleDateFormat("yyyy-MM-dd H:mm:ss").format(transaction.date)+"\",\""+transaction.amount+"\","+transaction.srcAccount.id+","+transaction.destAccount.id+"," +
                        "\""+transaction.type+"\")";
            }
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new RuntimeException("Transaction Not Added. Deposit Operation Failed.");
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Currency> GetAllCurrencies(){
        ArrayList<Currency> currencies= new ArrayList<Currency>();
        try {
            Connection connection=getConnection();
            String query="SELECT * from currencies;";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            while (resultSet.next())
            {
                Currency currency=new Currency();
                currency.id=resultSet.getInt("id");
                currency.curr_name=resultSet.getString("curr_name");
                currency.curr_annotation=resultSet.getString("curr_annotation");
                currency.curr_value=resultSet.getDouble("curr_value");
                currencies.add(currency);
            }
            if (currencies.size()==0){
                throw new RuntimeException("No currency found in system.");
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
            Connection connection=getConnection();
            String query="Insert into accounts(user_id,curr_id,balance) Values("+account.user.user_id+","+account.currency.id+",0.0)";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new RuntimeException("Opening new account in "+account.currency.curr_annotation+" currency operation failed.");
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
            Connection connection=getConnection();
            String query="SELECT * from transactions " +
                    "where (trans_from_acc_id="+acc_id+" OR trans_to_acc_id="+acc_id+") " +
                    "AND trans_date between \""+new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"\" and \""+new SimpleDateFormat("yyyy-MM-dd").format(temp)+"\"" +
                    "order by trans_date desc";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            while (resultSet.next())
            {
                Transaction transaction = new Transaction();
                transaction.id=resultSet.getInt("id");
                transaction.date=resultSet.getDate("trans_date");
                transaction.amount=resultSet.getDouble("trans_amount");
                transaction.type=resultSet.getString("trans_type");
                if(acc_id==resultSet.getInt("trans_from_acc_id")){
                    transaction.srcAccount=DatabaseHandler.FindAccountById(acc_id);
                    if(resultSet.getInt("trans_to_acc_id")==-1){
                        transaction.destAccount=new Account();
                        transaction.destAccount.id=-1;
                        transaction.accNum=resultSet.getString("account_number");
                        transaction.accHolder=resultSet.getString("account_holder_name");
                        transaction.bankName=resultSet.getString("bank_name");
                    }
                    else{
                        transaction.destAccount=DatabaseHandler.FindAccountById(resultSet.getInt("trans_to_acc_id"));
                    }

                }
                else {
                    transaction.destAccount = DatabaseHandler.FindAccountById(acc_id);
                    transaction.srcAccount=DatabaseHandler.FindAccountById(resultSet.getInt("trans_from_acc_id"));
                }
                transactions.add(transaction);
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
