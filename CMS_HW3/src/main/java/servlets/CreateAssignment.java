package servlets;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import models.Assignment;
import models.Course;
import models.User;


@WebServlet("/CreateAssignment")
public class CreateAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			if(((User)request.getSession().getAttribute("user")).getRole().equals("TEACHER")){
				String idIdentifier = (String) request.getParameter("id");
				request.setAttribute("courseId",idIdentifier);
				request.getRequestDispatcher("/WEB-INF/CreateAssignmentView.jsp").forward(
						request, response);
			}
		}
	}

	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			if(((User)request.getSession().getAttribute("user")).getRole().equals("TEACHER")){
				String idIdentifier = (String) request.getParameter("id");
				String assignName = (String)request.getParameter("assignName");
				DatabaseHandler.AddNewAssignment(assignName,Integer.parseInt(idIdentifier));
				response.sendRedirect("./DisplayAssignments?id="+idIdentifier);
			}
		}

	}
	

}

