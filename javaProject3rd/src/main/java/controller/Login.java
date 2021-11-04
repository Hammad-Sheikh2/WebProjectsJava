package controller;

import db.DatabaseHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login  extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("role")!=null) {
            response.sendRedirect("./index");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT role, id FROM login WHERE email=? AND password=?", email, password);
            String role = null;
            int id = 0;
            while(result.next()) {
                role = result.getString("role");
                id = result.getInt("id");
            }
            if(role==null) {
                request.setAttribute("error", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            else{
                request.getSession().setAttribute("role", role);
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("id", id);
                response.sendRedirect("./index");
                return;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
        	System.out.println(e.getMessage());
        }
        request.setAttribute("error", "Something went wrong, try again");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
