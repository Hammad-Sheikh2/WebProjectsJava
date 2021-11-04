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

import com.video.service.LendingService;
import com.video.model.Lend;
import com.video.service.MemberService;
import com.video.model.*;
@WebServlet("/VideoPurchase")
public class VideoPurchase extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public VideoPurchase() {
		super();
	}

	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		Lend r = new Lend();
		r.setUsername(u.getUsername());
		r.setMoviename(request.getParameter("movie"));
		r.setType("Purchase");
		r.setCdtype(request.getParameter("type"));
		r.setNoofdays("-");
		r.setNo(request.getParameter("no"));
		int cost;
		if (r.getCdtype().equals("CD"))
			cost = Integer.parseInt(request.getParameter("no"))
					* Integer.parseInt(request.getParameter("vcd"));
		else
			cost = Integer.parseInt(request.getParameter("no"))
					* Integer.parseInt(request.getParameter("dvd"));
		r.setCost(cost);
		r.setCardHolderName(request.getParameter("cname"));
		r.setCardNumber(request.getParameter("cno"));
		r.setCopies(0);
		LendingService dao = new LendingService();
		try {
			if (dao.insertLendingDetailstoDb1(r)!=null)
				rd = request.getRequestDispatcher("/userpurchasesuccess.jsp");
			else
				rd = request.getRequestDispatcher("/userpurchasefail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			rd = request.getRequestDispatcher("/");
		}
		rd.forward(request, response);
	}

	
}
