package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modals.Course;

@WebServlet("/DisplaySubmissions")
public class DisplaySubmissions extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DisplaySubmissions() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int aId = Integer.parseInt(request.getParameter("aId"));
		HttpSession session = request.getSession();
		ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
		request.setAttribute("courseId",id);
		request.setAttribute("courseName",allCourses.get(id).getName());
		request.setAttribute("assignmentId",aId);
		request.setAttribute("assignmentName",allCourses.get(id).getMyAssignments().get(aId).getName());
		request.setAttribute("title","Course Management");
		request.setAttribute("submissions",allCourses.get(id).getMyAssignments().get(aId).getMySubmissions());
		request.getRequestDispatcher("WEB-INF/submissions.jsp").forward(request, response);
    }

}
