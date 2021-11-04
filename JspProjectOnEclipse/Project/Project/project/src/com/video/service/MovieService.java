package com.video.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.video.model.Video;
import com.video.model.User;
import com.video.util.ResourceHelper;

public class MovieService {
	public boolean addMovietoDb(Video video) throws Exception {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"insert into video(`name`, `staring`, `language`,"
				+ " `director`, `producer`, `vcd`, `dvd`, `rent`, `availableCopies`)"
				+ " values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1, video.getName());
		ps.setString(2, video.getStaring());
		ps.setString(3, video.getLanguage());
		ps.setString(4, video.getDirector());
		ps.setString(5, video.getProducer());
		ps.setInt(6, video.getVcd());
		ps.setInt(7, video.getDvd());
		ps.setInt(8, video.getRent());
		ps.setInt(9, video.getAvailabelCopies());
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return flag;
	}
	public boolean deletemovie(int id) throws SQLException {
		boolean flag = false;
		PreparedStatement ps = ResourceHelper.getConnection().prepareStatement(
				"delete from video where `ID`=?");
		ps.setInt(1, id);
		int i = ps.executeUpdate();
		if (i == 1)
			flag = true;
		return true;
	}

}
