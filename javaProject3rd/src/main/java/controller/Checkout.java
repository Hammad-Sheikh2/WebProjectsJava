package controller;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import db.Cart;
import db.DatabaseHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Checkout  extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DatabaseHandler dbhandler = new DatabaseHandler();
            dbhandler.executeSQLStatement("DELETE FROM cart WHERE customerId=?", request.getSession().getAttribute("id"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        Stripe.apiKey = "sk_test_4eC39HqLyjWDarjtT1zdp7dc";
        response.setContentType("application/javascript");
        float price = Float.parseFloat(request.getParameter("price"));
        List<Object> paymentMethodTypes =
                new ArrayList<>();
        paymentMethodTypes.add("card");
        List<Object> lineItems = new ArrayList<>();
        Map<String, Object> lineItem1 = new HashMap<>();
        Map<String, Object> price_data = new HashMap<>();
        price_data.put("currency", "usd");
        price_data.put("unit_amount", (int)(price*100));
        Map<String, Object> product_data = new HashMap<>();
        product_data.put("name", "Product");
        price_data.put("product_data", product_data);
        lineItem1.put("price_data", price_data);
        lineItem1.put("quantity", 1);
        lineItems.add(lineItem1);
        Map<String, Object> params = new HashMap<>();
        params.put(
                "success_url",
                "https://example.com/success"
        );
        params.put(
                "cancel_url",
                "https://example.com/cancel"
        );
        params.put(
                "payment_method_types",
                paymentMethodTypes
        );
        params.put("line_items", lineItems);
        params.put("mode", "payment");
        try {
            Session session = Session.create(params);
            response.getWriter().println("{\"id\":\""+session.getId()+"\"}");
        } catch (StripeException e) {
            e.printStackTrace();
        }
    }
}
