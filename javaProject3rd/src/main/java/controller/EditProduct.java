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

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class EditProduct  extends HttpServlet {
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
        request.getRequestDispatcher("admin_edit_product.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String descText = request.getParameter("descText");
        String descHtml = request.getParameter("descHtml");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String scale = request.getParameter("scale");
        String vendor = request.getParameter("vendor");
        String PdtDescription = request.getParameter("PdtDescription");
        String qtyInStock = request.getParameter("qtyInStock");
        String buyPrice = request.getParameter("buyPrice");
        String msrp = request.getParameter("msrp");
        String category = request.getParameter("category");
        Part file = request.getPart("image");
        String filePath = getServletContext().getRealPath("/img/product")+"/"+file.getSubmittedFileName();
        file.write(filePath);
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            int r = dbhandler.insertQuery("UPDATE Product SET name=?, scale=?, vendor=?, pdtdescription=?, qtyinstock=?, buyprice=?, msrp=?, code=?, category=?, image=?, review=?, information=? WHERE id=?",
                    name, scale, vendor, PdtDescription, qtyInStock, buyPrice, msrp, code, category, file.getSubmittedFileName(), descText, descHtml, id);
            if(r>0)
            {
                request.setAttribute("error", "Product Updated");
                response.sendRedirect("./product?id="+id);
                return;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("error", "Something went wrong, try again");
        request.getRequestDispatcher("admin_edit_product.jsp").forward(request, response);
    }
}
