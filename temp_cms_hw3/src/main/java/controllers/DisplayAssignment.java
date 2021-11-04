package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Assignment;
import models.Course;


@WebServlet("/DisplayAssignments")
public class DisplayAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idIdentifier = (String) request.getParameter("id");
		if(request.getSession().getAttribute("user")!=null){
			request.setAttribute("user", request.getSession().getAttribute("user"));
		}
		Course course =DatabaseHandler.FindCourseById(Integer.parseInt(idIdentifier));
		request.setAttribute("assignments", course.getMyAssignments());
		request.setAttribute("courseName",course.getName());
		request.setAttribute("courseId",idIdentifier);
		request.setAttribute("title","Courses");
		request.getRequestDispatcher("/WEB-INF/DisplayAssignmentView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
