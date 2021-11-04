package controller;

import db.DatabaseHandler;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViewUsers  extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("cart", 0);
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT COUNT(*) as cart_sum FROM cart WHERE customerId=?", request.getSession().getAttribute("id"));
            while(result.next())
                request.setAttribute("cart", result.getInt("cart_sum"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if(request.getSession().getAttribute("role")==null ||
        request.getSession().getAttribute("role").equals("customer")) {
            response.sendRedirect("./");
            return;
        }
        ArrayList<User> users = new ArrayList<>();
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT * FROM login");
            while(result.next()){
                User user = new User();
                user.email = result.getString("email");
                user.firstname = result.getString("firstname");
                user.country = result.getString("country");
                user.lastname = result.getString("lastname");
                user.id = result.getInt("id");
                users.add(user);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin_user.jsp").forward(request,response);
    }
}
