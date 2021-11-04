package controllers;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CreateCourse")
public class CreateCourse extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCourse() {
        super();

    }


    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user")!=null){
            if(((User)request.getSession().getAttribute("user")).getRole().equals("TEACHER")){
                request.getRequestDispatcher("/WEB-INF/CreateCourseView.jsp").forward(
                        request, response);
            }
        }
    }


    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user")!=null){
            if(((User)request.getSession().getAttribute("user")).getRole().equals("TEACHER")){
                String name = request.getParameter("courseName");
                DatabaseHandler.AddNewCourse(name);
                response.sendRedirect("./DisplayCourses");
            }
        }
    }
}
