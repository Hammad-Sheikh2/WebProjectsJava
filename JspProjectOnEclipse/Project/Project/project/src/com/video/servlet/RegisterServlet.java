package com.video.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.video.service.MemberService;
import com.video.model.User;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
		super();
	}

	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = null;
		boolean flag = false;
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setAccno(Integer.parseInt(request.getParameter("accno")));
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setAddress(request.getParameter("address"));
		user.setCity(request.getParameter("city"));
		user.setPhone(Integer.parseInt(request.getParameter("phone")));
		user.setEmail(request.getParameter("email"));
		try {
			flag = new MemberService().addMemberstoDb(user);
			if (flag) {
				rd = request.getRequestDispatcher("/registersuccess.jsp");
			} else
				rd = request.getRequestDispatcher("/registerfail.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rd = request.getRequestDispatcher("/registerfail.jsp");
			e.printStackTrace();
		}
		rd.forward(request, response);
	}

	
	

}
