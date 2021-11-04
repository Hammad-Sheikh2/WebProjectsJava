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

@WebServlet("/CreateAssignment")
public class CreateAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
		allCourses.get(id).getMyAssignments().add(new Assignment((String)request.getParameter("assignName")));
		session.setAttribute("allCourses", allCourses);
		response.sendRedirect("./DisplayAssignments?id="+id);



	}

}
