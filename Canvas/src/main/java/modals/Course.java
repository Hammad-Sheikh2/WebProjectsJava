package modals;

import java.util.ArrayList;

public class Course {
    private String name;
    private ArrayList<Assignment> myAssignments = new ArrayList<Assignment>();

    public Course(String newName, ArrayList<Assignment> newMyAssignment) {
        setName(newName);
        myAssignments = newMyAssignment;
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
}
