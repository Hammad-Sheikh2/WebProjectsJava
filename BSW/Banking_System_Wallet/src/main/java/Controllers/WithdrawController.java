package Controllers;

import Modals.Account;
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

@WebServlet("/Withdraw")
public class WithdrawController extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        if(request.getSession().getAttribute("user_id")==null){
            request.setAttribute("status",false);
            request.setAttribute("message","Session Expired");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        response.setContentType("application/json");
        try{
            int acc_id=Integer.parseInt(request.getParameter("acc_id"));
            double amount=Double.parseDouble(request.getParameter("amount"));
            if(amount <1){
                throw new RuntimeException("Enter Positive Amount.");
            }
            Account destAccount=new Account();
            String accNumber=request.getParameter("accNumber");
            String accHolder=request.getParameter("accHolder");
            String bankName =request.getParameter("bankName");
            Account srcAccount=DatabaseHandler.FindAccountById(acc_id);

            if(srcAccount.balance<amount){
                throw new RuntimeException("Amount is more than account balance. Current account balance is "+srcAccount.balance+" "+srcAccount.currency.curr_annotation);
            }
            Transaction transaction= new Transaction();
            transaction.srcAccount=srcAccount;
            transaction.destAccount=destAccount;
            transaction.accHolder=accHolder;
            transaction.bankName=bankName;
            transaction.destAccount.id=-1;
            transaction.amount=amount;
            transaction.type="WITHDRAW";
            transaction.accNum=accNumber;
            transaction.date=new Date();
            DatabaseHandler.WithdrawAmount(transaction);
            response.getWriter().println("{\"status\":true,\"message\":\"Amount Withdrawn Successfully.\"}");
            return;
        }
        catch (Exception e){
            response.getWriter().println("{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
    }
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
            ArrayList<Account> accounts = DatabaseHandler.GetUserAllAccounts(user.user_id);
            if(accounts.size()<1){
                throw new RuntimeException("Hello "+user.user_name+", you dont have open account in any currency. So you can't use withdraw service.");
            }
            request.setAttribute("accounts",accounts);
            request.setAttribute("status",true);
        }
        catch(Exception e){
            request.setAttribute("status",false);
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("withdraw.jsp").forward(request, response);
    }
}
