package controllers;

import modals.Course;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping("/DisplaySubmissions")
public class DisplaySubmissions {
    @RequestMapping(method= RequestMethod.GET, value="/")
    public ModelAndView displayAssignments(HttpSession session, @RequestParam("id") int id, @RequestParam("aId") int aId){
        ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
        ModelAndView mv = new ModelAndView("submissions");
        //Here you can see Controller {Servlet} sending proper modals to view {JSP Page}.
        mv.addObject("courseId",id);
        mv.addObject("courseName",allCourses.get(id).getName());
        mv.addObject("assignmentId",aId);
        mv.addObject("assignmentName",allCourses.get(id).getMyAssignments().get(aId).getName());
        mv.addObject("title","Course Management");
        mv.addObject("submissions",allCourses.get(id).getMyAssignments().get(aId).getMySubmissions());
        return mv;
    }
}
