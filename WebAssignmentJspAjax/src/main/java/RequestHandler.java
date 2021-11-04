import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class RequestHandler extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        response.setContentType("application/json");
        String action = request.getParameter("action");
        try {
            switch (action)
            {
                case "Add":
                    String itemName=request.getParameter("itemName");
                    String itemPrice=request.getParameter("itemPrice");
                    response.getWriter().println(Add(itemName,Integer.parseInt(itemPrice)));
                    break;
                case "View":
                    response.getWriter().println(View());
                    break;
                case "Delete":
                    String item=request.getParameter("item");
                    response.getWriter().println(Delete(item));
                    break;
                case "Update":
                    String name=request.getParameter("name");
                    String price2=request.getParameter("price");
                    response.getWriter().println(Update(name,Integer.parseInt(price2)));
                    break;
            }
        }
        catch (Exception e)
        {

        }

    }
    public static Connection getConnection()throws SQLException,ClassNotFoundException
    {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/webassignment","root","1234");
    }
    public static String Add(String itemName,int price)throws SQLException,ClassNotFoundException
    {
        Connection connection=getConnection();
        String query="Insert into menu(item,price) Values(\""+itemName+"\","+price+")";
        Statement statement=connection.createStatement();
        int rowsAffected=statement.executeUpdate(query);
        if(!(rowsAffected==0))
            return "{\"status\":true,\"msg\":\"Item Added\"}";
        else
            return "{\"status\":false,\"msg\":\"Item Not Added\"}";
    }
    public static String Update(String itemName,int price)throws SQLException,ClassNotFoundException
    {
        Connection connection=getConnection();
        String query="UPDATE `menu` SET `price` = "+price+" WHERE `item` = '"+itemName+"'";;
        Statement statement=connection.createStatement();
        int rowsAffected=statement.executeUpdate(query);
        if(!(rowsAffected==0))
            return "{\"status\":true,\"msg\":\"Item Updated\"}";
        else
            return "{\"status\":false,\"msg\":\"Item Not Update\"}";
    }
    public static String Delete(String itemName)throws SQLException,ClassNotFoundException
    {
        Connection connection=getConnection();
        String query="DELETE FROM menu WHERE item='"+itemName+"'";
        Statement statement=connection.createStatement();
        int rowsAffected=statement.executeUpdate(query);
        if(!(rowsAffected==0))
            return "{\"status\":true,\"msg\":\"Item Deleted Successfully\"}";
        else
            return "{\"status\":false,\"msg\":\"Item Not Found.\",\"query\":\""+query+"\"}";
    }
    public static String View()throws SQLException,ClassNotFoundException
    {
        Connection connection=getConnection();
        String query="SELECT * from menu";
        Statement statement=connection.createStatement();
        ResultSet resultSet=statement.executeQuery(query);
        String output="{\"status\":true,\"result\":[";
        int i=0;
        while (resultSet.next())
        {
            output+= "{\"item\":\"" + resultSet.getString("item") + "\",\"price\":" + resultSet.getString("price") + "}";
            if(!resultSet.isLast())
            {
                output+=",";
            }
            i++;
        }
        output+="]}";
        return output;
    }
}
