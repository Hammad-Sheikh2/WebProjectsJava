package com.video.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

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

import sun.util.locale.provider.AvailableLanguageTags;

import com.sun.org.apache.xml.internal.security.signature.reference.ReferenceSubTreeData;
import com.video.model.*;
@WebServlet("/VideoLend")
public class VideoLend extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public VideoLend() {
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
		int availabeCopies=0;
		int requiredCopies=0;
		LendingService dao = new LendingService();
		Lend r1 = null;
		int cost;
		try {
			r.setUsername(u.getUsername());
			r.setMoviename(request.getParameter("movie"));
			r.setType("Rent");
			r.setCdtype("-");
			r.setNoofdays(request.getParameter("no"));
			r.setNo("-");
			 availabeCopies=Integer.parseInt(request.getParameter("availableCopies"));
			 requiredCopies=Integer.parseInt(request.getParameter("copyno"));
			r.setCardHolderName(request.getParameter("cname"));
			r.setCardNumber(request.getParameter("cno"));
			if(availabeCopies!=0 && availabeCopies>0 ) {
				if(requiredCopies!=0 && requiredCopies <=availabeCopies) {
					r.setCopies(requiredCopies);
					cost = (Integer.parseInt(request.getParameter("no"))+requiredCopies)
					* Integer.parseInt(request.getParameter("rent"));
					r.setCopies(requiredCopies);
					r.setCost(cost);
					int remainingCopies=availabeCopies-requiredCopies;
					if(dao.updateCopies(r.getMoviename(),remainingCopies)) {
						r1 = dao.insertLendingDetailstoDb1(r);
						
						if(r1!=null) {
							rd= request.getRequestDispatcher("/userrentredirect.jsp");
										  
						}else {
							rd= request.getRequestDispatcher("/userrentfail.jsp");
						}
						
					}
				}else {
					rd= request.getRequestDispatcher("/userrentfail.jsp");
				}
		 }else {
				rd= request.getRequestDispatcher("/userrentfail.jsp");
			}
						
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			rd = request.getRequestDispatcher("/");
		}
		
		rd.forward(request, response);
	}

	

}
