package com.video.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.video.service.LendingService;

/**
 * Servlet implementation class ReturnMovie
 */
@WebServlet("/ReturnMovie")
public class ReturnMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		LendingService rendao=new LendingService();
		int rentId=Integer.parseInt(request.getParameter("ID"));
		int rentedCopies=Integer.parseInt(request.getParameter("rentedCopies"));
		String name=request.getParameter("name");
		int availableCopies=Integer.parseInt(request.getParameter("availableCopies"));
		try {
			int totalCopies=rentedCopies+availableCopies;
			if(rendao.deleteRent(rentId)) {
				if(rendao.updateCopies(name, totalCopies)) {
					rd= request.getRequestDispatcher("/userrentredirect.jsp");
				}else {
					rd= request.getRequestDispatcher("/userrentfail.jsp");
				}
			};
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rd.forward(request, response);
		//doGet(request,response);
	}
}
