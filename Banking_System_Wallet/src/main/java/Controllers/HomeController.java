package Controllers;

import Modals.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/Home")
public class HomeController extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
        if(request.getSession().getAttribute("user_id")==null){
            request.setAttribute("status",false);
            request.setAttribute("message","Don't be over-smart, we handle all authentication. First Register yourself " +
                    "with system and Login to use our services.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        try{
            User user= DatabaseHandler.FindUserById((int)request.getSession().getAttribute("user_id"));
            request.setAttribute("user",user);
            request.setAttribute("accounts", DatabaseHandler.GetUserAllAccounts(user.user_id));
            request.setAttribute("status",true);
        }
        catch(Exception e){
            request.setAttribute("status",false);
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
