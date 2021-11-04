import com.sun.istack.internal.NotNull;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class DBHandler extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response){

        response.setContentType("application/json");
        String action=request.getParameter("action");
        try {
            switch (action)
            {
                case "ValidateUser":
                    String username=request.getParameter("username");
                    String password=request.getParameter("password");
                    response.getWriter().println(VerifyUser(username,password));
                    break;
                case "SaveLoggedInUserDetail":
                    String id=request.getParameter("id");
                    String isLoggedIn=request.getParameter("isLoggedIn");
                    response.getWriter().println(SaveLoggedInUserDetail(Integer.parseInt(id),Integer.parseInt(isLoggedIn)));
                    break;
                case "getLoggedInUserData":
                    response.getWriter().println(getLoggedInUserData());
                    break;
                case "GetUserData":
                    id=request.getParameter("id");
                    response.getWriter().println(GetUserData(Integer.parseInt(id)));
                    break;
                case "changeUserPassword":
                    password=request.getParameter("password");
                    id=request.getParameter("id");
                    response.getWriter().println(changeUserPassword(password,Integer.parseInt(id)));
                    break;
                case "makeNewUser":
                    String fullName=request.getParameter("fullName");
                    String email=request.getParameter("email");
                    username=request.getParameter("username");
                    password=request.getParameter("password");
                    String role=request.getParameter("role");
                    response.getWriter().println(makeNewUser(fullName,email,username,password,role));
                    break;
            }
        }
        catch (Exception e)
        {

        }
    }
    public String VerifyUser(String username,String password)
    {
        String output;
        try {
            Connection connection=getConnection();
            String query="SELECT * from user where username =\""+username+"\" AND pass =\""+password+"\"";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            resultSet.next();
            output="{\"status\":true,\"result\":";
            output+= "{\"id\":\"" + resultSet.getString("id") + "\",\"fullName\":\"" + resultSet.getString("fullName") + "\",\"email\":\"" + resultSet.getString("email") + "\"," +
                    "\"username\":\""+resultSet.getString("username")+"\",\"password\":\""+resultSet.getString("pass")+"\",\"role\":\""+resultSet.getString("role")+"\"}}";
        }
        catch (Exception e)
        {
            output="{\"status\":false,\"result\":\"Invalid User\"}";
        }
        return output;
    }
    public String GetUserData(int id)
    {
        String output;
        try {
            Connection connection=getConnection();
            String query="SELECT * from user where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            resultSet.next();
            output="{\"status\":true,\"result\":";
            output+= "{\"id\":\"" + resultSet.getString("id") + "\",\"fullName\":\"" + resultSet.getString("fullName") + "\",\"email\":\"" + resultSet.getString("email") + "\"," +
                    "\"username\":\""+resultSet.getString("username")+"\",\"password\":\""+resultSet.getString("pass")+"\",\"role\":\""+resultSet.getString("role")+"\"}}";
        }
        catch (Exception e)
        {
            output="{\"status\":false,\"result\":\"Invalid User\"}";
        }
        return output;
    }
    public String SaveLoggedInUserDetail(int id,int isLoggedIn)
    {
        String output;
        try {
            Connection connection=getConnection();
            String query="UPDATE `logged_in_user` SET `is_logged_in` = "+isLoggedIn+", `user_id` = "+id+" WHERE `id` = 0";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(!(rowsAffected==0))
                output= "{\"status\":true,\"msg\":\"Item Updated Successfully\",\"query\":\""+query+"\"}";
            else
                output= "{\"status\":false,\"msg\":\"Item Not Found.\",\"query\":\""+query+"\"}";
        }
        catch (Exception e)
        {
            output="{\"status\":false,\"result\":\"Something went wrong\"}";
        }
        return output;
    }
    public String getLoggedInUserData(){
        String output;
        try {
            Connection connection=getConnection();
            String query="SELECT * from logged_in_user";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            resultSet.next();
            output="{\"status\":true,\"result\":";
            output+= "{\"userId\":" + resultSet.getString("user_id") + ",\"isLoggedIn\":" + resultSet.getString("is_logged_in")+"}}";
        }
        catch (Exception e)
        {
            output="{\"status\":false,\"result\":\"Invalid User\"}";
        }
        return output;
    }
    public static Connection getConnection()throws SQLException,ClassNotFoundException
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/project_approval_system","root","1234");
    }
    public String changeUserPassword(String newPassword,int id) {
        String output;
        try {
            Connection connection=getConnection();
            String query="UPDATE `user` SET `pass` = '"+newPassword+"' WHERE `id` = "+id;
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(!(rowsAffected==0))
                output= "{\"status\":true,\"msg\":\"Password Updated Successfully\",\"query\":\""+query+"\"}";
            else
                output="{\"status\":false,\"result\":\"Something went wrong\"}";
        }
        catch (Exception e)
        {
            output="{\"status\":false,\"result\":\"Something went wrong\"}";
        }
        return output;
    }
    public int nextUserId()
    {
        try {
            Connection connection=getConnection();
            String query="SELECT count(*) as \"lastId\" FROM user";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            resultSet.next();
            return Integer.parseInt(resultSet.getString("lastId"));
        }
        catch (Exception e)
        {
            return -1;
        }
    }
    public String makeNewUser(String fullName,String email,String username,String password,String role){
        String output;
        try {
            Connection connection=getConnection();
            String query="INSERT into user(id,fullName,email,username,pass,role) VALUES ("+nextUserId()+",\""+fullName+"\",\""+email+"\",\""+username+"\",\""+password+"\",\""+role.toUpperCase()+"\")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(!(rowsAffected==0))
                output= "{\"status\":true,\"msg\":\"New User Added\"}";
            else
                output= "{\"status\":false,\"msg\":\"Not Added.\"}";
        }
        catch (Exception e)
        {
            output="{\"status\":false,\"result\":\"Something went wrong\"}";
        }
        return output;
    }
}