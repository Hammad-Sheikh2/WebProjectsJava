package com.video.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.video.service.MemberService;
import com.video.model.*;
@WebServlet("/MemberProfileUpdate")
public class MemberProfileUpdate extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public MemberProfileUpdate() {
		super();
	}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean flag = false;
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		String username = u.getUsername();
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		int phone =  Integer.parseInt(request.getParameter("phone"));
		String email = request.getParameter("email");
		u.setFirstname(firstname);
		u.setLastname(lastname);
		u.setAddress(address);
		u.setCity(city);
		u.setPhone(phone);
		u.setEmail(email);
		MemberService ud = new MemberService();
		try {
			flag = ud.updatingMemberProfile(username, firstname, lastname, address,
					city, phone, email);
			if (flag) {
				rd = request
						.getRequestDispatcher("/userprofilechangesuccess.jsp");
				session.setAttribute("user", u);
			} else
				rd = request.getRequestDispatcher("/userprofilechangefail.jsp");
		} catch (Exception e) {
			rd = request.getRequestDispatcher("/userprofilechangefail.jsp");
			e.printStackTrace();
		}
		rd.forward(request, response);

	}

	
}
