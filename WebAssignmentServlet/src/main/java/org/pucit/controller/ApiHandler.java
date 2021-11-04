package org.pucit.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.*;

@Controller
@RequestMapping("/")
public class ApiHandler {
    @RequestMapping(method = RequestMethod.GET ,value = "/")
    public String MainPage(ModelMap modelMap){
        return "index";
    }
    @RequestMapping(method = RequestMethod.POST ,value = "/add")
    public String ADD(@RequestParam("country") String country,@RequestParam("rank") String rank, ModelMap modelMap){
        try {
            Connection connection=getConnection();
            String result;
            String query="Insert into ranking(team,score) Values(\""+country+"\","+rank+")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(!(rowsAffected==0))
                result= "{\"status\":true,\"msg\":\"Item Added\"}";
            else
                result= "{\"status\":false,\"msg\":\"Item Not Added\"}";

            modelMap.addAttribute("data",result);
        }
        catch (Exception e)
        {
            modelMap.addAttribute("data","{\"status\":false,\"msg\":\"Item Not Added\"}");
        }
        return "handler";
    }
    @RequestMapping(method = RequestMethod.POST ,value = "/view")
    public String View(ModelMap modelMap){
        try {
            Connection connection=getConnection();
            String query="SELECT * from ranking";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            String output="{\"status\":true,\"result\":[";
            int i=0;
            while (resultSet.next())
            {
                output+= "{\"country\":\"" + resultSet.getString("team") + "\",\"rank\":" + resultSet.getString("score") + "}";
                if(!resultSet.isLast())
                {
                    output+=",";
                }
                i++;
            }
            output+="]}";
            modelMap.addAttribute("data",output);
        }
        catch (Exception e)
        {
            modelMap.addAttribute("data","{\"status\":false,\"msg\":\"Something went wrong. Data not extracted.\"}");
        }
        return "handler";
    }
    @RequestMapping(method = RequestMethod.POST ,value = "/update")
    public String Update(@RequestParam("country") String country,@RequestParam("rank") String rank, ModelMap modelMap){
        try{
            Connection connection=getConnection();
            String query="UPDATE `ranking` SET `score` = "+rank+" WHERE `team` = '"+country+"'";
            Statement statement=connection.createStatement();
            String result;
            int rowsAffected=statement.executeUpdate(query);
            if(!(rowsAffected==0))
                result= "{\"status\":true,\"msg\":\"Item Updated Successfully\",\"query\":\""+query+"\"}";
            else
                result= "{\"status\":false,\"msg\":\"Item Not Found.\",\"query\":\""+query+"\"}";
            modelMap.addAttribute("data",result);
        }
        catch (Exception e){
            modelMap.addAttribute("data","{\"status\":false,\"msg\":\"Item Not Updated\"}");
        }
        return "handler";
    }
    @RequestMapping(method = RequestMethod.POST ,value = "/delete")
    public String Delete(@RequestParam("country") String country,ModelMap modelMap){
        try {
            Connection connection=getConnection();
            String query="DELETE FROM ranking WHERE team='"+country+"'";
            Statement statement=connection.createStatement();
            String result;
            int rowsAffected=statement.executeUpdate(query);
            if(!(rowsAffected==0))
                result= "{\"status\":true,\"msg\":\"Item Deleted Successfully\",\"query\":\""+query+"\"}";
            else
                result= "{\"status\":false,\"msg\":\"Item Not Found.\",\"query\":\""+query+"\"}";
            modelMap.addAttribute("data",result);
        }
        catch (Exception e){
            modelMap.addAttribute("data","{\"status\":false,\"msg\":\"Item Not Deleted\"}");
        }
        return "handler";
    }
    public static Connection getConnection()throws SQLException,ClassNotFoundException
    {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket_ranking","root","1234");
    }
}
