package modals;

import java.text.SimpleDateFormat;
import java.util.*;

public class Submission {
	
	private String studentName;
	private String studentAnswer;
	private String date;
	
	private String dateTimeFormat = "MM/dd/yyyy hh:mm a";
	
	
	public Submission(String newStudentName, String newStudentAnswer) {
		studentName = newStudentName;
		studentAnswer = newStudentAnswer;
		Date objDate = new Date();
		SimpleDateFormat dt_formatter = new SimpleDateFormat(dateTimeFormat);
		this.date = dt_formatter.format(objDate);
	}
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentAnswer() {
		return studentAnswer;
	}
	public void setStudentAnswer(String studentAnswer) {
		this.studentAnswer = studentAnswer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		Date objDate = new Date();
		SimpleDateFormat dt_formatter = new SimpleDateFormat(dateTimeFormat);
		this.date = dt_formatter.format(objDate);
	}
}
