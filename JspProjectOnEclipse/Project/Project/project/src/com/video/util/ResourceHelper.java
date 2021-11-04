package com.video.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ResourceHelper {
	private static Connection connection;

	public static Connection getConnection() {
		
		String url="jdbc:mysql://localhost:3306/video_rent";
		String DRIVER_NAME="com.mysql.jdbc.Driver";
		String USER_NAME="root";
		String password="";
		try {
			Class.forName(DRIVER_NAME);
			connection = DriverManager.getConnection(
					url, USER_NAME,
					password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
