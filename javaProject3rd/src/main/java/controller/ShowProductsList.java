package controller;

import db.DatabaseHandler;
import db.Department;
import db.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShowProductsList  extends HttpServlet {
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
        String s = "%"+(request.getParameter("search")==null?"":request.getParameter("search"))+"%";
        String cat = (request.getParameter("category")==null?"0":request.getParameter("category"));
        ArrayList<Product> products = new ArrayList<>();
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            ResultSet result = dbhandler.getData("SELECT * FROM product WHERE (name like ? OR pdtdescription LIKE ? OR review LIKE ? OR information LIKE ?) AND (category=? OR ?='0')", s, s, s, s, cat, cat);
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
                products.add(product);
            }
            result=dbhandler.getData("select name from department where id=?", cat);
            request.setAttribute("cat", "All Categories");
            while(result.next())
                request.setAttribute("cat", result.getString("name"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("shop-grid.jsp").forward(request,response);
    }
}