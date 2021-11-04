package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Submission;
import models.Course;
import models.User;


@WebServlet("/CreateSubmission")
public class CreateSubmission extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSubmission() {
        super();
        
    }

	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			if(((User)request.getSession().getAttribute("user")).getRole().equals("STUDENT")){
				String idIdentifier = (String) request.getParameter("id");
				String aIdIdentifier = (String) request.getParameter("aId");
				request.setAttribute("courseId", idIdentifier);
				request.setAttribute("assignmentId", aIdIdentifier);
				request.getRequestDispatcher("/WEB-INF/CreateSubmissionView.jsp").forward(
						request, response);
			}
		}
	}

	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			if(((User)request.getSession().getAttribute("user")).getRole().equals("STUDENT")){
				String idIdentifier = (String) request.getParameter("id");
				String aIdIdentifier = (String) request.getParameter("aId");
				String name = request.getParameter("studentName");
				String comment = request.getParameter("comment");
				Submission submission=new Submission(name,comment);
				DatabaseHandler.AddNewSubmission(submission,((User)request.getSession().getAttribute("user")).getId(),Integer.parseInt(aIdIdentifier));
				DatabaseHandler.UpdateLatestSubmissionDateOfAssignment(Integer.parseInt(aIdIdentifier),submission.getDate());
				response.sendRedirect("./DisplaySubmissions?id="+Integer.parseInt(idIdentifier)+"&aId="+Integer.parseInt(aIdIdentifier));
			}
		}
	}

}
