package org.controller;
import org.modal.Item;
import org.modal.User;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class DatabaseHandler {
    //This function is used for make connection to project database.
    public static Connection getConnection()throws SQLException,ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_e","root","your_password");
    }
    //This function will execute query and check is user registered under this email and password.
    public static User validateUser(String email, String password){
        try {
            Connection connection=getConnection();
            String query="SELECT * from users where email=\""+email+"\" AND pass=\""+password+"\"";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            User user = null;
            while (resultSet.next())
            {
                user=new User();
                user.id=resultSet.getInt("id");
                user.username=resultSet.getString("username");
                user.password=resultSet.getString("pass");
                user.email=resultSet.getString("email");
                user.phn=resultSet.getString("phn");

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
    //This function find User under requested id if found then return User.
    public static User FindUserById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from users where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            User user = null;
            while (resultSet.next())
            {
                user=new User();
                user.id=resultSet.getInt("id");
                user.username=resultSet.getString("username");
                user.password=resultSet.getString("pass");
                user.email=resultSet.getString("email");
                user.phn=resultSet.getString("phn");

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
    //This function saves data of new user in users table of project database.
    public static void registerUser(User user){

        try {
            Connection connection=getConnection();
            String query="Insert into users(username,pass,email,phn) Values(\""+user.username+"\",\""+user.password+"\",\""+user.email+"\",\""+user.phn+"\")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new Exception();
        }
        catch (Exception e)
        {
            throw new RuntimeException("User Not Added.");
        }
    }
    //This function saves data of new item in items table of project database.
    public static void AddNewItem(Item item){

        try {
            Connection connection=getConnection();
            String query="Insert into items(itemName,itemDescription,itemImage,userId,itemDateTime,isSold,itemQuantity) Values(\""+item.itemName+"\",\""+item.itemDescription+"\",\""+item.itemImage+"\",\""+item.user.id+"\",\""+new SimpleDateFormat("yyyy-MM-dd H:mm:ss").format(item.dateTime) +"\",false,"+item.itemQuantity+")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new Exception();
        }
        catch (Exception e)
        {
            throw new RuntimeException("Item Not Published.");
        }
    }
    //This function get all items except that user items having id = userId(Parameter) form items table.
    public static ArrayList<Item> GetAllItemsAvailableToBuy(int userId){
        try {
            Connection connection=getConnection();
            String query="SELECT * from items where userid <>"+userId;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            ArrayList<Item> items = new ArrayList<Item>();
            while (resultSet.next())
            {
                Item item=new Item();
                item.id=resultSet.getInt("id");
                item.itemName=resultSet.getString("itemName");
                item.itemImage= resultSet.getString("itemImage");
                item.itemDescription=resultSet.getString("itemDescription");
                item.dateTime=resultSet.getDate("itemDateTime");
                item.isSold=resultSet.getBoolean("isSold");
                item.itemQuantity=resultSet.getInt("itemQuantity");
                User user = new User();
                try{
                    user=FindUserById(resultSet.getInt("userId"));
                    item.user=user;
                    items.add(item);
                }
                catch (Exception e){}
            }
            if (items.size()==0){
                throw new RuntimeException("No Data Found");
            }
            return items;
        }
        catch (Exception e)
        {
            throw new RuntimeException(""+e.getMessage());
        }
    }
    //This function get all items of user items having id = userId(Parameter) form items table.
    public static ArrayList<Item> GetAllMyItems(int userId){
        try {
            Connection connection=getConnection();
            String query="SELECT * from items where userid ="+userId;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            ArrayList<Item> items = new ArrayList<Item>();
            while (resultSet.next())
            {
                Item item=new Item();
                item.id=resultSet.getInt("id");
                item.itemName=resultSet.getString("itemName");
                item.itemImage= resultSet.getString("itemImage");
                item.itemDescription=resultSet.getString("itemDescription");
                item.dateTime=resultSet.getDate("itemDateTime");
                item.isSold=resultSet.getBoolean("isSold");
                item.itemQuantity=resultSet.getInt("itemQuantity");
                User user = new User();
                try{
                    user=FindUserById(resultSet.getInt("userId"));
                    item.user=user;
                    items.add(item);
                }
                catch (Exception e){}
            }
            if (items.size()==0){
                throw new RuntimeException("No Data Found");
            }
            return items;
        }
        catch (Exception e)
        {
            throw new RuntimeException(""+e.getMessage());
        }
    }
    //This function get item having id = id(Parameter) form items table.
    public static Item GetItemById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from items where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            Item item = null;
            while (resultSet.next())
            {
                item=new Item();
                item.id=resultSet.getInt("id");
                item.itemName=resultSet.getString("itemName");
                item.itemImage= resultSet.getString("itemImage");
                item.itemDescription=resultSet.getString("itemDescription");
                item.dateTime=resultSet.getDate("itemDateTime");
                item.isSold=resultSet.getBoolean("isSold");
                item.itemQuantity=resultSet.getInt("itemQuantity");
                User user = new User();
                try{
                    user=FindUserById(resultSet.getInt("userId"));
                    item.user=user;
                    return item;
                }
                catch (Exception e){
                    throw new RuntimeException("Item Owner Not Found.");
                }

            }
            throw new RuntimeException("Item Not Found.");
        }
        catch (Exception e)
        {
            throw new RuntimeException("Item Not Found");
        }
    }
    //This function update item quantity, add number(Parameter) in previous quantity.
    public static void AddStockInItem(int id,int number,boolean isSold){
        try{
            Connection connection=getConnection();
            String query="UPDATE items SET itemQuantity = itemQuantity + "+number+", isSold = "+isSold+" WHERE `id` = "+id;
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if((rowsAffected==0))
                throw new RuntimeException("Stock Not Added. Something went wrong in connection with Database.");

        }
        catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }
    //This function update item quantity, subtract number(Parameter) in previous quantity.
    public static void ReduceStockInItem(int id,int number,boolean isSold){
        try{
            Connection connection=getConnection();
            String query="UPDATE items SET itemQuantity = itemQuantity - "+number+", isSold = "+isSold+" WHERE `id` = "+id;
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if((rowsAffected==0))
                throw new RuntimeException("Stock Not Updated. Something went wrong in connection with Database.");

        }
        catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }
}
