package com.video.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.video.model.Video;
import com.video.service.MovieService;

@WebServlet("/AdminMovieController")
public class AdminMovieController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AdminMovieController() {
		super();
	}



	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = null;
		Video movie = new Video();
		movie.setName(request.getParameter("moviename"));
		movie.setStaring(request.getParameter("staring"));
		movie.setLanguage(request.getParameter("language"));
		movie.setDirector(request.getParameter("director"));
		movie.setProducer(request.getParameter("producer"));
		movie.setVcd(Integer.parseInt(request.getParameter("vcd")));
		movie.setDvd(Integer.parseInt(request.getParameter("dvd")));
		movie.setRent(Integer.parseInt(request.getParameter("rent")));//copy
		movie.setAvailabelCopies(Integer.parseInt(request.getParameter("copy")));
		MovieService md = new MovieService();
		try {
			if (md.addMovietoDb(movie)) {
				rd = request.getRequestDispatcher("/adminmoviesuccess.jsp");
			} else {
				rd = request.getRequestDispatcher("/adminmoviefail.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		rd.forward(request, response);
	}

	

}
