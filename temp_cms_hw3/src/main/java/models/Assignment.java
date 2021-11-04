package models;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Assignment {
	private int id;
	private int course_id;
	private ArrayList<Submission> mySubmissions = new ArrayList<Submission>();
	private String name;
	private String maxDateString;

	public Assignment(int id, int course_id, ArrayList<Submission> mySubmissions, String name, String maxDateString) {
		this.id = id;
		this.course_id = course_id;
		this.mySubmissions = mySubmissions;
		this.name = name;
		this.maxDateString = maxDateString;
	}

	public Assignment(String newName) {
		setName(newName);
	}

	public ArrayList<Submission> getMySubmissions() {
		return mySubmissions;
	}

	public void setMySubmissions(ArrayList<Submission> mySubmissions) {
		this.mySubmissions = mySubmissions;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaxDateString() {
		return maxDateString = getMySubmissions().get(getMySubmissions().size()-1).getDate();
	}

	public void setMaxDateString(String maxDateString) {
		this.maxDateString = maxDateString;
	}

	public int getId() {
		return id;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
}
