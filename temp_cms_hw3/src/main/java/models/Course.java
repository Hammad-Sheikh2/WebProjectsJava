package models;

import java.util.*;

public class Course {

	private int id;
	private String name;
	private ArrayList<Assignment> myAssignments = new ArrayList<Assignment>();

	public Course(int id, String name, ArrayList<Assignment> myAssignments) {
		this.id = id;
		this.name = name;
		this.myAssignments = myAssignments;
	}

	public Course(String newName) {
		setName(newName);
	}
	
	public ArrayList<Assignment> getMyAssignments() {
		return myAssignments;
	}

	public void setMyAssignments(ArrayList<Assignment> myAssignments) {
		this.myAssignments = myAssignments;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}
}
