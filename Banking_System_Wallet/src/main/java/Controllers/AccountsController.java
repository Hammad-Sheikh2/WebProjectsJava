package Controllers;

import Modals.Account;
import Modals.Currency;
import Modals.Transaction;
import Modals.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/Accounts")
public class AccountsController extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        if(request.getSession().getAttribute("user_id")==null){
            request.setAttribute("status",false);
            request.setAttribute("message","Don't be over-smart, we handle all authentication. First Register yourself " +
                    "with system and Login to use our services.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        try{
            User user= DatabaseHandler.FindUserById((int)request.getSession().getAttribute("user_id"));
            request.setAttribute("user",user);
            request.setAttribute("currencies",DatabaseHandler.GetAllCurrencies());
            try{
                request.setAttribute("accounts", DatabaseHandler.GetUserAllAccounts(user.user_id));
            }
            catch(Exception e){
                request.setAttribute("accounts", new ArrayList<Account>());
            }
            request.setAttribute("status",true);
        }
        catch(Exception e){
            request.setAttribute("status",false);
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("accounts.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        if(request.getSession().getAttribute("user_id")==null){
            request.setAttribute("status",false);
            request.setAttribute("message","Session Expired");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        response.setContentType("application/json");
        try{
            Currency currency=DatabaseHandler.FindCurrencyById(Integer.parseInt(request.getParameter("curr_id")));
            User user= DatabaseHandler.FindUserById((int)request.getSession().getAttribute("user_id"));
            Account account = new Account();
            account.user=user;
            account.currency=currency;
            DatabaseHandler.OpenNewAccount(account);
            response.getWriter().println("{\"status\":true,\"message\":\"Account Registered Successfully.\"}");
        }
        catch (Exception e){
            response.getWriter().println("{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
    }
}

