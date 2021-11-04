package com.video.util;

public class TestClass {

	public static void main(String[] args) {
		java.sql.Connection con=ResourceHelper.getConnection();
	if(con!=null) {
		System.out.println("Connected");
	}else {
		System.out.println("Not connected");
	}
	}

}
