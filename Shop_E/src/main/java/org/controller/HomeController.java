package org.controller;
import org.modal.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class HomeController{
    @Autowired
    ServletContext context;
    @RequestMapping(method = RequestMethod.GET ,value = "/")
    public ModelAndView MainPage(){
        return new ModelAndView("index");
    }
    @RequestMapping(method = RequestMethod.GET ,value = "SignUp")
    public ModelAndView SignUpPage(){
        return new ModelAndView("SignUp");
    }
    @RequestMapping(method = RequestMethod.POST ,value = "validateUser")
    public ModelAndView ValidateUser(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session){
        try {
            User user = DatabaseHandler.validateUser(email,password);
            session.setAttribute("userId",user.id);
            ModelAndView mv =new ModelAndView("Home");
            return mv;
        }
        catch (Exception e){
            ModelAndView mv=new ModelAndView();
            mv.addObject("Message","<div class=\"mt-3 alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  Incorrect Credentials. "+e.getMessage()+"\n" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            mv.setViewName("index");
            return mv;
        }
    }
    @RequestMapping(method = RequestMethod.POST ,value = "RegisterUser")
    public ModelAndView RegisterUser(@RequestParam("username") String username,@RequestParam("phn") String phn,@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session){
        try {
            ModelAndView mv=new ModelAndView();
            User user=new User();
            user.username=username;
            user.password=password;
            user.email=email;
            user.phn=phn;
            DatabaseHandler.registerUser(user);
            mv.addObject("data","{\"message\":\"User Account Registered Successfully.\",\"isError\":false}");
            mv.setViewName("handler");
            return mv;
        }
        catch (Exception e){
            ModelAndView mv=new ModelAndView();
            mv.addObject("data","{\"message\":\"User Not Added.\",\"isError\":true}");
            mv.setViewName("handler");
            return mv;
        }
    }
}
