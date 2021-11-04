package controller;

import db.DatabaseHandler;
import db.Department;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Home extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("cart", 0);
        ArrayList<Department> departments = new ArrayList<>();
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT COUNT(*) as cart_sum FROM cart WHERE customerId=?", request.getSession().getAttribute("id"));
            while(result.next())
                request.setAttribute("cart", result.getInt("cart_sum"));
            dbhandler = new DatabaseHandler();
            result = dbhandler.getData("SELECT * FROM department");
            while (result.next())
            {
                Department department = new Department();
                department.id = result.getInt("id");
                department.name = result.getString("name");
                departments.add(department);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("departments", departments);
        if(request.getSession().getAttribute("role")!=null && request.getSession().getAttribute("role").equals("admin"))
            request.getRequestDispatcher("admin_index.jsp").forward(request,response);
        else
            request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
