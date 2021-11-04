package Controllers;

import Modals.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginController extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        try{
            request.getSession().setAttribute("user_id", DatabaseHandler.validateUser(username,password).user_id);
            response.sendRedirect("./Home");
        }
        catch (Exception e){
            request.setAttribute("status",false);
            request.setAttribute("message",e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
