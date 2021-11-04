package com.video.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.video.service.MemberService;
import com.video.service.MovieService;

/**
 * Servlet implementation class DeleteMovie
 */
@WebServlet("/DeleteMovie")
public class DeleteMovie extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMovie() {
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
		int id=Integer.parseInt(request.getParameter("ID"));
		MovieService ms=new MovieService();
		try {
//			ms.deleteUser(id);
			if (ms.deletemovie(id)) {
				rd = request.getRequestDispatcher("/adminhome.jsp");
			} else {
				rd = request.getRequestDispatcher("/adminMovies.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		rd.forward(request, response);
	}

}
