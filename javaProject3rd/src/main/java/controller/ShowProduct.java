package controller;

import db.DatabaseHandler;
import db.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShowProduct extends HttpServlet {
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

        String id = request.getParameter("id");
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT * FROM product WHERE id=?", id);
            while(result.next()){
                Product product = new Product();
                product.name = result.getString("name");
                product.image = result.getString("image");
                product.buyPrice = result.getFloat("buyprice");
                product.qtyInStock = result.getInt("qtyinstock");
                product.id = result.getInt("id");
                product.scale = result.getString("scale");
                product.vendor = result.getString("vendor");
                product.PdtDescription = result.getString("pdtdescription");
                product.msrp = result.getString("msrp");
                product.code = result.getString("code");
                product.category = result.getInt("category");
                product.descText = result.getString("review");
                product.descHtml = result.getString("information");
                request.setAttribute("product", product);
                request.getRequestDispatcher("shopping-details.jsp").forward(request,response);
                break;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.getWriter().println("404 - product not found");
    }
}