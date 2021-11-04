package controllers;

import modals.Assignment;
import modals.Course;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@Controller
@RequestMapping("/CreateAssignment")
public class CreateAssignment{
    @RequestMapping(method = RequestMethod.GET, value = "/")
    public void createAssignment(HttpSession session, @RequestParam("id") int id,@RequestParam("assignName") String assignName, HttpServletResponse response)throws IOException {
        ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
        allCourses.get(id).getMyAssignments().add(new Assignment(assignName));
        session.setAttribute("allCourses", allCourses);
        response.sendRedirect("../DisplayAssignments/?id="+id);
    }
}
