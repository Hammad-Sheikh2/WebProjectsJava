package servlets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
@WebServlet("/add-customer")
public class AddCustomer extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        String id =request.getParameter("id");
        String name =request.getParameter("name");
        String age =request.getParameter("age");
        String city =request.getParameter("city");
        String state =request.getParameter("state");
        String add_1 =request.getParameter("add_1");
        String add_2 =request.getParameter("add_2");
        try {
        	request.setAttribute("msg",Add_New_Customer(id,name,age,city,state,add_1,add_2));
        	request.getRequestDispatcher("new_customer.jsp").forward(request, response);
        }
        catch(Exception e) {
        	request.setAttribute("errmsg",e.getMessage());
        	request.getRequestDispatcher("new_customer.jsp").forward(request, response);
        }
    }
    public String Add_New_Customer(String id,String name,String age,String city,String state,String add_1,String add_2) {
 	   	Statement st=DatabaseUtil.getConnection().createStatement();
 	   	int i = st.executeUpdate("insert into customers(customer_ssn_id,cus_name,age,address_line1,address_line2,city,state)"
 	   			+ " values("+id+",'"+name+"',"+age+", '"+add_1+"','"+add_2+"','"+city+"','"+state+"')");
 	   	return "Customer creation initiated successfully.";
    }
}
