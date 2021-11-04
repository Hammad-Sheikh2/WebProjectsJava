package controller;
import java.util.UUID;
import db.DatabaseHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddCategory  extends HttpServlet {
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
            response.sendRedirect("./index");
            return;
        }
        request.getRequestDispatcher("admin_category.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            int r = dbhandler.insertQuery("INSERT INTO Department(name) VALUES(?)", name);
            if(r>0)
            {
                request.setAttribute("error", "Department created");
                response.sendRedirect("./shop?category="+r);
                return;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("error", "Something went wrong, try again");
        request.getRequestDispatcher("admin_category.jsp").forward(request, response);
    }
}
