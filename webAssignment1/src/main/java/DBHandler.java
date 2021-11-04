import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class DBHandler extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        response.setContentType("application/json");
        String action = request.getParameter("action");
        try {
            if(action.equals("Add"))
            {
                String country=request.getParameter("country");
                String rank=request.getParameter("rank");
                Connection connection=getConnection();
                String result;
                String query="Insert into ranking(team,score) Values(\""+country+"\","+rank+")";
                Statement statement=connection.createStatement();
                int rowsAffected=statement.executeUpdate(query);
                if(!(rowsAffected==0))
                    result= "{\"status\":true,\"msg\":\"Item Added\"}";
                else
                    result= "{\"status\":false,\"msg\":\"Item Not Added\"}";
                response.getWriter().println(result);
            }
            if(action.equals("View"))
            {
                Connection connection=getConnection();
                String query="SELECT * from ranking";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(query);
                String output="{\"status\":true,\"result\":[";
                int i=0;
                while (resultSet.next())
                {
                    output+= "{\"country\":\"" + resultSet.getString("team") + "\",\"rank\":" + resultSet.getString("score") + "}";
                    if(!resultSet.isLast())
                    {
                        output+=",";
                    }
                    i++;
                }
                output+="]}";
                response.getWriter().println(output);
            }
            if(action.equals("Delete"))
            {
                String country=request.getParameter("country");
                Connection connection=getConnection();
                String query="DELETE FROM ranking WHERE team='"+country+"'";
                Statement statement=connection.createStatement();
                String result;
                int rowsAffected=statement.executeUpdate(query);
                if(!(rowsAffected==0))
                    result= "{\"status\":true,\"msg\":\"Item Deleted Successfully\",\"query\":\""+query+"\"}";
                else
                    result= "{\"status\":false,\"msg\":\"Item Not Found.\",\"query\":\""+query+"\"}";
                response.getWriter().println(result);
            }
            if(action.equals("Update"))
            {
                String country=request.getParameter("country");
                String rank=request.getParameter("rank");
                Connection connection=getConnection();
                String query="UPDATE `ranking` SET `score` = "+rank+" WHERE `team` = '"+country+"'";
                Statement statement=connection.createStatement();
                String result;
                int rowsAffected=statement.executeUpdate(query);
                if(!(rowsAffected==0))
                    result= "{\"status\":true,\"msg\":\"Item Updated Successfully\",\"query\":\""+query+"\"}";
                else
                    result= "{\"status\":false,\"msg\":\"Item Not Found.\",\"query\":\""+query+"\"}";
                response.getWriter().println(result);
            }
        }
        catch (Exception e)
        {
        }
    }
    public static Connection getConnection()throws SQLException,ClassNotFoundException
    {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket_ranking","root","1234");
    }
}
