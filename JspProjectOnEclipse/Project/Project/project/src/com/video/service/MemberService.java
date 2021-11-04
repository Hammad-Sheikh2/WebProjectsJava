package com.video.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.video.model.User;
import com.video.util.ResourceHelper;

public class MemberService {
	public boolean addMemberstoDb(User user) throws Exception {
		// String[] returnId = { "ID" };
		boolean flag = false;
		PreparedStatement preparedStat = ResourceHelper.getConnection().prepareStatement(
				"insert into user(`username`,`password`,`accno`,`firstname`,"
				+ "`lastname`,`address`,`city`,`phone`,`email`)"
				+ "values(?,?,?,?,?,?,?,?,?)");
		preparedStat.setString(1, user.getUsername());
		preparedStat.setString(2, user.getPassword());
		preparedStat.setInt(3, user.getAccno());
		preparedStat.setString(4, user.getFirstname());
		preparedStat.setString(5, user.getLastname());
		preparedStat.setString(6, user.getAddress());
		preparedStat.setString(7, user.getCity());
		preparedStat.setString(8, Integer.toString(user.getPhone()));
		preparedStat.setString(9, user.getEmail());
		int i = preparedStat.executeUpdate();
//		 try (ResultSet result=preparedStat.getGeneratedKeys()) {
//	            if (result.next()) {
//	                user.setID(result.getInt(10));
//	            }
//	            else {
//	                throw new SQLException("Creating transaction failed, no ID obtained.");
//	            }
//	        } catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		if (i == 1)
			flag = true;
		return flag;
	}

	public User searchMemberforLogin(String username, String password) throws Exception {
		User user = null;
		PreparedStatement preparedStat = ResourceHelper.getConnection().prepareStatement(
				"select * from user where username=? and password=?");
		preparedStat.setString(1, username);
		preparedStat.setString(2, password);
		ResultSet rs = preparedStat.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setUsername(rs.getString(1));
			user.setPassword(rs.getString(2));
			user.setAccno(rs.getInt(3));
			user.setFirstname(rs.getString(4));
			user.setLastname(rs.getString(5));
			user.setAddress(rs.getString(6));
			user.setCity(rs.getString(7));
			user.setPhone(rs.getInt(8));
			user.setEmail(rs.getString(9));
		}
		return user;
	}

	public boolean changingPassword(String uname, String pass)
			throws Exception {
		boolean flag = false;
		PreparedStatement preparedStat = ResourceHelper.getConnection().prepareStatement(
				"update user set password=? where username=?");
		preparedStat.setString(1, pass);
		preparedStat.setString(2, uname);
		int i = preparedStat.executeUpdate();
		if (i == 1)
			flag = true;
		return flag;
	}

	public boolean updatingMemberProfile(String uname, String fname,
			String lname, String addr, String city, int phone,
			String email) throws Exception {
		boolean flag = false;
		PreparedStatement preparedStat = ResourceHelper
				.getConnection()
				.prepareStatement(
						"update user set firstname=?,lastname=?,address=?,city=?,phone=?,email=? where username=?");
		preparedStat.setString(1, fname);
		preparedStat.setString(2, lname);
		preparedStat.setString(3, addr);
		preparedStat.setString(4, city);
		preparedStat.setInt(5, phone);
		preparedStat.setString(6, email);
		preparedStat.setString(7, uname);
		int i = preparedStat.executeUpdate();
		if (i == 1)
			flag = true;
		return flag;
	}
	public boolean deleteUser(int id) throws SQLException {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"delete from user where `ID`=?");
		ps.setInt(1, id);
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return true;
	}
}