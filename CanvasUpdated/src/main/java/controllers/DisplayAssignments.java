package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modals.Course;

@WebServlet("/DisplayAssignments")
public class DisplayAssignments extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DisplayAssignments() {
        super();
        // TODO Auto-generated constructor stub
    }
    
public void init(ServletConfig config) throws ServletException {
		
		super.init(config);
}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("courseId",id);
		request.setAttribute("courseName",allCourses.get(id).getName());
		request.setAttribute("title","Course Management");
		request.setAttribute("assignments",allCourses.get(id).getMyAssignments());
		request.getRequestDispatcher("WEB-INF/assignments.jsp").forward(request, response);
	}

}
