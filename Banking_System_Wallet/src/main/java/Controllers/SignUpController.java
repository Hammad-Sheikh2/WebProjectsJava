package Controllers;

import Modals.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SignUp")
public class SignUpController extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        User user=new User();
        user.user_name=request.getParameter("username");
        user.user_email=request.getParameter("email");
        user.user_national_id=request.getParameter("nationalId");
        user.user_contact=request.getParameter("contact");
        user.user_password=request.getParameter("password");
        user.user_address=request.getParameter("address");
        try{
            DatabaseHandler.registerUser(user);
            request.setAttribute("status",true);
            request.setAttribute("message","User Registered Successfully.");
        }
        catch(Exception e){
            request.setAttribute("status",false);
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
}
