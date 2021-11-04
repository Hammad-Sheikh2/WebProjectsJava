package controller;

import db.DatabaseHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Register  extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("role")!=null) {
            response.sendRedirect("./");
            return;
        }
        request.getRequestDispatcher("registration.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");
        String role = null;
        String confirmpassword = request.getParameter("password-confirm");
        if(!confirmpassword.equals(password))
        {
            request.setAttribute("error", "Password doest not match");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT role FROM login WHERE email=?", email);
            while(result.next())
                role = result.getString("role");
            if(role!=null) {
                request.setAttribute("error", "Email already exists");
                request.getRequestDispatcher("registration.jsp").forward(request, response);
                return;
            }
            dbhandler = new DatabaseHandler();
            int r = dbhandler.insertQuery("INSERT INTO login(email, password, firstname, lastname, gender, country, role) VALUES(?,?,?,?,?,?,?)",
                    email, password, firstname, lastname, gender, country, "customer");
            if(r>0)
            {
                request.getSession().setAttribute("role", "customer");
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("id", r);
                response.sendRedirect("./");
                return;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("error", "Something went wrong, try again");
        request.getRequestDispatcher("registration.jsp").forward(request, response);
    }
}
