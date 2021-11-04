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

@WebServlet("/MemberLogin")
public class MemberLogin extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	
	public MemberLogin() {
		super();
	}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = null;
		if (request.getParameter("username").equals("admin")
				&& request.getParameter("password").equals("admin"))
			rd = request.getRequestDispatcher("/adminhome.jsp");
		else {
			try {
				User user = new MemberService().searchMemberforLogin(request
						.getParameter("username"), request
						.getParameter("password"));
				if (user != null) {
					rd = request.getRequestDispatcher("/userhome.jsp");
					request.getSession().setAttribute("user", user);
				} else
					rd = request.getRequestDispatcher("/loginfail.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				rd = request.getRequestDispatcher("/loginfail.jsp");
				e.printStackTrace();
			}
		}
		rd.forward(request, response);
	}

	
}