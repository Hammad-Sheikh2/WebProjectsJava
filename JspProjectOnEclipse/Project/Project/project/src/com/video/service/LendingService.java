package com.video.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.video.model.Lend;
import com.video.util.ResourceHelper;

public class LendingService {
	public boolean insertLendingDetailstoDb(Lend rent) throws Exception {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"insert into rent values(?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, rent.getUsername());
		ps.setString(2, rent.getMoviename());
		ps.setString(3, rent.getType());
		ps.setString(4, rent.getCdtype());
		ps.setString(5, rent.getNoofdays());
		ps.setString(6, rent.getNo());
		ps.setInt(7, rent.getCost());
		ps.setString(8, rent.getCardHolderName());
		ps.setString(9, rent.getCardNumber());
		ps.setInt(10,0);
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return flag;
	}
	
	public Lend insertLendingDetailstoDb1(Lend rent) throws Exception {
		 String[] returnId = { "ID" };
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"insert into rent (`username`,`moviename`,`type`,"
				+ "`cdtype` ,`noofdays`,`no`,`cost`,`cardholdername`,`cardnumber`,`rentedCopies`)"
				+ "values(?,?,?,?,?,?,?,?,?,?)",returnId);
		ps.setString(1, rent.getUsername());
		ps.setString(2, rent.getMoviename());
		ps.setString(3, rent.getType());
		ps.setString(4, rent.getCdtype());
		ps.setString(5, rent.getNoofdays());
		ps.setString(6, rent.getNo());
		ps.setInt(7, rent.getCost());
		ps.setString(8, rent.getCardHolderName());
		ps.setString(9, rent.getCardNumber());
		ps.setInt(10, rent.getCopies());
		int i = ps.executeUpdate();
		
		 try (ResultSet result=ps.getGeneratedKeys()) {
	            if (result.next()) {
	                rent.setUniqueKey(result.getInt(1));
	            }
	            else {
	                throw new SQLException("Creating transaction failed, no ID obtained.");
	            }
	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return rent;
		
	}
	public boolean updateCostCreditCardDetails(String cardNumber, String cardholderName,int ID,String cost)
			throws Exception {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"update rent set cost=?, cardholdername=?,cardnumber=? where ID=?");
		ps.setString(1, cost);
		ps.setString(2, cardholderName);
		ps.setString(3,cardNumber);
		ps.setInt(4, ID);
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return true;
	}
	public boolean updateCopies(String moviename, int copies)
			throws Exception {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"update video set availableCopies=? where name=?");
		ps.setInt(1, copies);
		ps.setString(2, moviename);
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return true;
	}
	public boolean updateRentedCopies(int id, int copies)
			throws Exception {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"update rent set rentedCopies=? where ID=?");
		ps.setInt(1, copies);
		ps.setInt(2, id);
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return true;
	}
	
	public boolean deleteRent(int id) throws SQLException {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"delete from rent where ID=?");
		ps.setInt(1, id);
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return true;
	}
}
