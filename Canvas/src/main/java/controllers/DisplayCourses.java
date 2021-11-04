package controllers;

import com.sun.tracing.dtrace.ModuleAttributes;
import modals.Assignment;
import modals.Course;
import modals.Submission;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class DisplayCourses {

    @RequestMapping(method= RequestMethod.GET, value="/")
    public ModelAndView SendAllCourses(HttpSession session){
        ArrayList<Course> courseList = new ArrayList<Course>();
        courseList.add(new Course("CS3035 Programming Language Paradigms"));
        courseList.add(new Course("CS3220 Web and Internet Programming"));
        courseList.get(1).getMyAssignments().add(new Assignment("Lab1 Use of CS3 and Canvas"));
        courseList.get(1).getMyAssignments().add(new Assignment("Lab2 HTML Basics"));
        courseList.get(1).getMyAssignments().get(0).getMySubmissions().add(new Submission("John", "This is my Lab1 submission"));
        courseList.get(1).getMyAssignments().get(0).getMySubmissions().add(new Submission("Joe", "I uploaded my Lab1 to CS3"));

        session.setAttribute("allCourses",courseList);
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("courses",courseList);
        mv.addObject("title","Course Management");
        return mv;
    }

}
