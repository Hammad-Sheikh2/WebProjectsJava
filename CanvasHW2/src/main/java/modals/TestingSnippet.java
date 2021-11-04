package modals;

import java.util.*;

public class TestingSnippet {
	public static void main(String[]args) {
		ArrayList<Submission> subsList = new ArrayList<Submission>();
		subsList.add(new Submission("Sameen", "I wanna be the best!"));
		subsList.add(new Submission("Yassar", "Who's the best you said?"));
		subsList.add(new Submission("Khan", "I the king..."));
		subsList.add(new Submission("Argho", "Am I even in the game?"));
		
		ArrayList<Assignment> assignList = new ArrayList<Assignment>();
		assignList.add(new Assignment("Lab1: Help", subsList));
		assignList.add(new Assignment("Lab2: Yelp", subsList));
		assignList.add(new Assignment("Lab3: Nope", subsList));
		
		ArrayList<Course> courseList = new ArrayList<Course>();
		courseList.add(new Course("CyberSecurity", assignList));
		courseList.add(new Course("Physics"));
		
		System.out.println(courseList.get(0).getMyAssignments().get(0).getName());
	}
}
