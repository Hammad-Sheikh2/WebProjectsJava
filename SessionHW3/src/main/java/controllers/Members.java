package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;

@WebServlet("/Member")
public class Members extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user;
		try {
			user = (User) request.getSession().getAttribute("user");
		}catch(Exception e) {
			request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
			return;
		}
		request.setAttribute("user",user);
		request.getRequestDispatcher("WEB-INF/member.jsp").forward(request, response);
	}
}
