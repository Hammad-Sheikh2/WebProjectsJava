package controller;

import db.Cart;
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

public class AddToCart  extends HttpServlet {
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

        if(request.getSession().getAttribute("role")==null) {
            response.sendRedirect("./index");
            return;
        }
        ArrayList<Cart> carts = new ArrayList<>();
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT p.name as name, p.image as image, p.buyprice as price FROM product as p, cart WHERE customerId=? AND p.id=cart.productId", request.getSession().getAttribute("id"));
            while(result.next()){
                Cart c = new Cart();
                c.price = result.getFloat("price");
                c.image = result.getString("image");
                c.name = result.getString("name");
                carts.add(c);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("carts", carts);
        request.getRequestDispatcher("shoping-cart.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/javascript");
        String pid = request.getParameter("pid");
        if(request.getSession().getAttribute("id")==null){
            response.getWriter().println("{\"error\":\"Please login to add product\"}");
            return;
        }
        int cid = (int)request.getSession().getAttribute("id");
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            dbhandler.insertQuery("INSERT INTO cart(customerId, productId, quantity) VALUES(?,?,1)", cid, pid);
            response.getWriter().println("{\"error\":\"added\"}");
            return;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.getWriter().println("{\"error\":\"error\"}");
    }
}
