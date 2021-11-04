package modals;

import java.util.ArrayList;

public class Assignment {
    private ArrayList<Submission> mySubmissions = new ArrayList<Submission>();
    private String name;
    private String maxDateString;

    public Assignment(String newName, ArrayList<Submission> newMySubmissions) {
        setName(newName);
        mySubmissions = newMySubmissions;
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
}
