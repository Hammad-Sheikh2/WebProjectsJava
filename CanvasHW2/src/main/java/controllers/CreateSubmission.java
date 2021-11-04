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

import modals.Assignment;
import modals.Course;
import modals.Submission;

/**
 * Servlet implementation class CreateSubmission
 */
@WebServlet("/CreateSubmission")
public class CreateSubmission extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSubmission() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
		int id= Integer.parseInt( request.getParameter("id"));
		int aId =  Integer.parseInt( request.getParameter("aId"));
		String studentName = request.getParameter("studentName");
		String comment = request.getParameter("comment");
		allCourses.get(id).getMyAssignments().get(aId).getMySubmissions().add(new Submission(studentName,comment));
		session.setAttribute("allCourses", allCourses);
		response.sendRedirect("./DisplaySubmissions?id="+id+"&aId="+aId);
	}
}
