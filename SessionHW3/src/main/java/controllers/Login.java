package controllers;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;


public class Login extends HttpServlet{
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		
		super.init(config);
		// Main storage variable and default values to verify functionality
		User user = new User("cguo","123456"); 
		getServletContext().setAttribute("pre-defined_user", user);
		}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		User pre_defined_user = (User) getServletContext().getAttribute("pre-defined_user");
		if(pre_defined_user.getUsername().equals(username)&&pre_defined_user.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", pre_defined_user);
			response.sendRedirect("./Member");
		}else {
			doGet(request,response);
		}
	}
	
}
