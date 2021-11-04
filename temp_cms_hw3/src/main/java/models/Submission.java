package models;

import java.text.SimpleDateFormat;
import java.util.*;

public class Submission {
	private int id;
	private String studentName;
	private String studentAnswer;
	private String date;
	private int studentId;
	private String dateTimeFormat = "MM/dd/yyyy hh:mm a";

	public Submission(int id, String studentName, String studentAnswer, String date, int studentId) {
		this.id = id;
		this.studentName = studentName;
		this.studentAnswer = studentAnswer;
		this.date = date;
		this.studentId = studentId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getId() {
		return id;
	}

	public int getStudentId() {
		return studentId;
	}

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
