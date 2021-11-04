package controllers;

import models.Assignment;
import models.Course;
import models.Submission;
import models.User;

import java.sql.*;
import java.util.ArrayList;

public class DatabaseHandler {
    //JDBC Connection to Database
	static Connection getConnection() throws SQLException,ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/cmshw3","root","1234");
    }
    //Data Read
    public static User validateUser(String username, String password){
        try {
            Connection connection=getConnection();
            String query="SELECT * from users where username=\""+username+"\" AND password=\""+password+"\"";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            User user = null;
            while (resultSet.next())
            {
                user=new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("role")
                );
            }
            if (user == null){
                throw new RuntimeException("User Not Found");
            }
            return user;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static User FindUserById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from users where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            User user = null;
            while (resultSet.next())
            {
                user=new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("role")
                );
            }
            if (user == null){
                throw new RuntimeException("User Not Found.");
            }
            return user;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static Course FindCourseById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from courses where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            Course course = null;
            while (resultSet.next())
            {
                course=new Course(
                        resultSet.getInt("id"),
                        resultSet.getString("course_name"),
                        FindAssignmentsByCourseId(resultSet.getInt("id"))
                );
            }
            if (course == null){
                throw new RuntimeException("Course Not Found.");
            }
            return course;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Course> GetAllCourses(){
        try {
            Connection connection=getConnection();
            String query="SELECT * from courses;";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            ArrayList<Course> courses = new ArrayList<>();
            while (resultSet.next())
            {
                courses.add(new Course(
                        resultSet.getInt("id"),
                        resultSet.getString("course_name"),
                        FindAssignmentsByCourseId(resultSet.getInt("id"))
                ));
            }
            return courses;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static Assignment FindAssignmentById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from assignments where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            Assignment assignment = null;
            while (resultSet.next())
            {
                assignment=new Assignment(
                        resultSet.getInt("id"),
                        resultSet.getInt("course_id"),
                        FindSubmissionsByAssignmentId(resultSet.getInt("id")),
                        resultSet.getString("assignment_name"),
                        resultSet.getString("latest_submission")
                );
            }
            if (assignment == null){
                throw new RuntimeException("Assignment Not Found.");
            }
            return assignment;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Assignment> FindAssignmentsByCourseId(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from assignments where course_id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            ArrayList<Assignment> assignmentList = new ArrayList<>();
            while (resultSet.next())
            {
                assignmentList.add(new Assignment(
                        resultSet.getInt("id"),
                        resultSet.getInt("course_id"),
                        FindSubmissionsByAssignmentId(resultSet.getInt("id")),
                        resultSet.getString("assignment_name"),
                        resultSet.getString("latest_submission")
                ));
            }
            return assignmentList;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static Submission FindSubmissionById(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from submissions where id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            Submission submission = null;
            while (resultSet.next())
            {
                submission = new Submission(
                        resultSet.getInt("id"),
                        resultSet.getString("student_name"),
                        resultSet.getString("student_answer"),
                        resultSet.getString("submission_date"),
                        resultSet.getInt("student_id")
                );
            }
            if(submission==null){
                throw new RuntimeException("Submission Not Found");
            }
            return submission;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static ArrayList<Submission> FindSubmissionsByAssignmentId(int id){
        try {
            Connection connection=getConnection();
            String query="SELECT * from submissions where assignment_id="+id;
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            ArrayList<Submission> submissionList = new ArrayList<>();
            while (resultSet.next())
            {
                submissionList.add(new Submission(
                        resultSet.getInt("id"),
                        resultSet.getString("student_name"),
                        resultSet.getString("student_answer"),
                        resultSet.getString("submission_date"),
                        resultSet.getInt("student_id")
                ));
            }
            return submissionList;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    //Data Insertion
    public static void AddNewCourse(String courseName){
        try {
            Connection connection=getConnection();
            String query="Insert into courses(course_name) Values(\""+courseName+"\")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new RuntimeException("Course Registration Failed.");
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static void AddNewAssignment(String assignmentName,int courseId){
        try {
            Connection connection=getConnection();
            String query="Insert into assignments(assignment_name,course_id) Values(\""+assignmentName+"\","+courseId+")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new RuntimeException("Assignment Registration Failed.");
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static void AddNewSubmission(Submission submission,int userId,int assignmentId){
        try {
            Connection connection=getConnection();
            String query="Insert into submissions(student_name,student_answer,student_id,submission_date,assignment_id) Values(\""+submission.getStudentName()+"\",\""+submission.getStudentAnswer()+"\","+userId+",\""+submission.getDate()+"\","+assignmentId+")";
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if(rowsAffected==0)
                throw new RuntimeException("Submission Registration Failed.");
        }
        catch (Exception e)
        {
            throw new RuntimeException(e.getMessage());
        }
    }
    //Data Updating
    public static void UpdateLatestSubmissionDateOfAssignment(int id,String date){
        try{
            Connection connection=getConnection();
            String query="UPDATE assignments SET latest_submission = \""+date+"\" WHERE `id` = "+id;
            Statement statement=connection.createStatement();
            int rowsAffected=statement.executeUpdate(query);
            if((rowsAffected==0))
                throw new RuntimeException("Latest Submission Not Updated.");
        }
        catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }
}
