package controllers;

import modals.Assignment;
import modals.Course;
import modals.Submission;
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
@RequestMapping("/CreateSubmission")
public class CreateSubmission {
    @RequestMapping(method = RequestMethod.GET, value = "/")
    public void CreateSubmission(HttpSession session,@RequestParam("id") int id, @RequestParam("aId") int aId,@RequestParam("studentName") String studentName,@RequestParam("comment") String comment, HttpServletResponse response)throws IOException {
        ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
        allCourses.get(id).getMyAssignments().get(aId).getMySubmissions().add(new Submission(studentName,comment));
        session.setAttribute("allCourses", allCourses);
        response.sendRedirect("../DisplayAssignments/?id="+id+"&aId="+aId);
    }
}
