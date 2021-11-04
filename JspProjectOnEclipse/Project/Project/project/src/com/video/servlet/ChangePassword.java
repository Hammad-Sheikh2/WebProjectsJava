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
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ChangePassword() {
		super();
	}

	
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd;
		User user = (User) request.getSession().getAttribute("user");
		String oldpassword1 = user.getPassword();
		String oldpassword2 = request.getParameter("oldpassword").trim();
		String newpassword1 = request.getParameter("newpassword").trim();
		String newpassword2 = request.getParameter("renewpassword").trim();
		if (!oldpassword1.equals(oldpassword2)
				|| !newpassword1.equals(newpassword2)) {
			rd = request.getRequestDispatcher("/userpasswordchangefail.jsp");
		} else {
			try {
				if (new MemberService().changingPassword(user.getUsername(), request
						.getParameter("newpassword"))) {
					rd = request
							.getRequestDispatcher("/userpasswordchangesuccess.jsp");
					user.setPassword(request.getParameter("newpassword"));
					request.getSession().setAttribute("user", user);
				} else {
					rd = request
							.getRequestDispatcher("/userpasswordchangefail.jsp");
				}
			} catch (Exception e) {
				rd = request
						.getRequestDispatcher("/userpasswordchangefail.jsp");
				e.printStackTrace();
			}
		}
		rd.forward(request, response);
	}

	
}
