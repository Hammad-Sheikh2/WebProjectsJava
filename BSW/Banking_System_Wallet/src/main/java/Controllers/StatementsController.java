package Controllers;

import Modals.Transaction;
import Modals.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/Statements")
public class StatementsController extends HttpServlet{
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
            Date startdate= new Date();
            Date enddate= new Date();
            int acc_id=-1;
            ArrayList<Transaction> transactions = new ArrayList<>();
            if(request.getParameter("acc_id")!=null)
                acc_id=Integer.parseInt(request.getParameter("acc_id"));
            if(request.getParameter("dateS")!=null){
                startdate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateS"));
                enddate= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateE"));
            }
            if(acc_id!=-1){
                transactions=DatabaseHandler.GetAllTransactionOfSpecificAccountAndInRangeOfDates(acc_id,startdate,enddate);
            }
            request.setAttribute("accounts", DatabaseHandler.GetUserAllAccounts(user.user_id));
            request.setAttribute("transactions", transactions);
            request.setAttribute("status",true);
        }
        catch(Exception e){
            request.setAttribute("status",false);
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("statements.jsp").forward(request, response);
    }
}
