package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Course;

/**
 * Servlet implementation class DisplaySubmissions
 */
@WebServlet("/DisplaySubmissions")
public class DisplaySubmissions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplaySubmissions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idIdentifier = (String) request.getParameter("id");
		String aIdIdentifier = (String) request.getParameter("aId");
		int aId=Integer.parseInt(aIdIdentifier);
		if(request.getSession().getAttribute("user")!=null){
			request.setAttribute("user", request.getSession().getAttribute("user"));
		}
		Course course =DatabaseHandler.FindCourseById(Integer.parseInt(idIdentifier));
		for (int i = 0; i < course.getMyAssignments().size(); i++) {
			if(course.getMyAssignments().get(i).getId()==aId){
				request.setAttribute("courseName",course.getName());
				request.setAttribute("courseId",idIdentifier);
				request.setAttribute("title","Courses");
				request.setAttribute("assignmentId",course.getMyAssignments().get(i).getId());
				request.setAttribute("assignmentName",course.getMyAssignments().get(i).getName());
				request.setAttribute("submissions",course.getMyAssignments().get(i).getMySubmissions());
				request.getRequestDispatcher("/WEB-INF/DisplaySubmissionsView.jsp").forward(
						request, response);
			}
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
