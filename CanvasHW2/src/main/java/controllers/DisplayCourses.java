package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modals.Assignment;
import modals.Course;
import modals.Submission;

public class DisplayCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DisplayCourses() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		
		super.init(config);
		// Main storage variable and default values to verify functionality
		ArrayList<Course> courseList = new ArrayList<Course>();	
		courseList.add(new Course("CS3035 Programming Language Paradigms"));
		courseList.add(new Course("CS3220 Web and Internet Programming"));
		
		courseList.get(1).getMyAssignments().add(new Assignment("Lab1 Use of CS3 and Canvas"));
		courseList.get(1).getMyAssignments().add(new Assignment("Lab2 HTML Basics"));
		
		courseList.get(1).getMyAssignments().get(0).getMySubmissions().add(new Submission("John", "This is my Lab1 submission"));
		courseList.get(1).getMyAssignments().get(0).getMySubmissions().add(new Submission("Joe", "I uploaded my Lab1 to CS3"));
		
		getServletContext().setAttribute("allCourses", courseList);
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		ArrayList<Course> courseList = (ArrayList<Course>) getServletContext().getAttribute("allCourses");
		  HttpSession session = request.getSession();
		  session.setAttribute("allCourses", courseList);
		  request.setAttribute("courses",courseList);
		  request.setAttribute("title","Course Management");
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
	}

}
