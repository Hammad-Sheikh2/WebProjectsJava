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
@RequestMapping("/DisplayAssignments")
public class DisplayAssignments {
    @RequestMapping(method= RequestMethod.GET, value="/")
    public ModelAndView displayAssignments(HttpSession session, @RequestParam("id") int id){
        ArrayList<Course> allCourses = (ArrayList<Course>) session.getAttribute("allCourses");
        ModelAndView mv = new ModelAndView("assignments");
        mv.addObject("courseId",id);
        mv.addObject("courseName",allCourses.get(id).getName());
        mv.addObject("title","Course Management");
        mv.addObject("assignments",allCourses.get(id).getMyAssignments());
        return mv;
    }
}
