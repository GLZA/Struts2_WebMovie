package com.pili.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.pili.pojo.Movie;
import com.pili.pojo.MovieType;

import org.json.JSONArray;
import net.sf.json.JSONObject;


public class MovieDao extends DataBase{
	public MovieType QueryMovieType(String movieType){
		String sql = "select * from moviehome where movieType = ?";
		MovieType src = new MovieType();
		Connection movieconn = this.getConn();
		try {
			PreparedStatement movieps = movieconn.prepareStatement(sql);
			movieps.setString(1,movieType);
			ResultSet rs = movieps.executeQuery();
			if(rs != null && rs.next()){
				src.setMovieSrc(rs.getString("movieSrc"));
				src.setMovieType(rs.getString("movieType"));
				src.setMovieCount(rs.getInt("count"));
			}
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			this.closeConn();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.closeAll();
		}
		return src;
	}
	public String queryMovie(String movieType){
		String sql = "select * from movies where movieType = ? ORDER BY movieID DESC";
		Movie movieSrc = new Movie();
		JSONArray json = new JSONArray();
		Map<String, Object> map = new HashMap<String, Object>();
		Connection movieconn = this.getConn();
		try {
			PreparedStatement movieps = movieconn.prepareStatement(sql);
			movieps.setString(1,movieType);
			ResultSet rs = movieps.executeQuery();
			while(rs.next()){
				JSONObject jo = new JSONObject();
				map.put("moviesID" ,rs.getInt("movieID"));
				map.put("moviesNa" ,rs.getString("movieName"));
				map.put("moviesTy" ,rs.getString("movieType"));
				map.put("moviesUr" ,rs.getString("movieUser"));
				map.put("moviesSr" ,rs.getString("movieSrc"));
				map.put("moviesImg",rs.getString("imgSrc"));
				jo = JSONObject.fromObject(map);
				json.put(jo);
			}
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			this.closeConn();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.closeAll();
		}
		return json.toString();
	}
	public Movie FirstUploadMovie(String movieName,String movieType,String movieUser){
		
		String sql = "insert into movies(movieID,movieName,movieType,movieUser) values(movieID,?,?,?)";
		Movie tm1 = null;
		Connection movieconn = this.getConn();
		ResultSet rs=null;
		try {
			PreparedStatement movieps = movieconn.prepareStatement(sql);
			movieps.setString(1,movieName);
			movieps.setString(2,movieType);
			movieps.setString(3,movieUser);
			int num = movieps.executeUpdate();
			if(num==1) 
			{
				sql = "select * from movies where movieName = ? and movieType = ? and movieUser=?";
				movieps = movieconn.prepareStatement(sql);
				movieps.setString(1,movieName);
				movieps.setString(2,movieType);
				movieps.setString(3,movieUser);
				rs = movieps.executeQuery();
				if(rs.next()){
					tm1 = new Movie();
					tm1.setMovieID(rs.getInt("movieID"));
					tm1.setStatus(1);
				}
			}
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			this.closeConn();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tm1;
	}
	public Movie SecondUploadMovie(int movieID,String realPath){
		String sql = "update movies set movieSrc = ?,imgSrc = ? where movieID = ?";
		Movie tm2 = null;
		Connection movieconn = this.getConn();
		try {
			PreparedStatement movieps = movieconn.prepareStatement(sql);
			movieps.setString(1,realPath);
			movieps.setString(2,realPath);
			movieps.setInt(3,movieID);
			int num = movieps.executeUpdate();
			if(num==1) 
			{
				tm2 = new Movie();
				tm2.setStatus(2);
			}
			if(pstmt != null) pstmt.close();
			this.closeConn();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.closeAll();
		}
		return tm2;
	}
	public Movie DeleteFSUploadMovie(int movieID){
		String sql = "DELETE FROM movies WHERE movieID = ?";
		Movie tm = null;
		Connection movieconn = this.getConn();
		try {
			PreparedStatement movieps = movieconn.prepareStatement(sql);
			movieps.setInt(1,movieID);
			int num = movieps.executeUpdate();
			tm = new Movie();
			if(num==1) 
			{
				tm.setStatus(66);
			}
			else{
				tm.setStatus(99);
			}
			if(pstmt != null) pstmt.close();
			this.closeConn();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.closeAll();
		}
		return tm;
	}
	public Movie updateMovie(int movieID,String movieName,String movieType){
		String sql = "update movies set movieName = ?,movieType = ? where movieID = ?";
		Movie tm = null;
		Connection movieconn = this.getConn();
		try {
			PreparedStatement movieps = movieconn.prepareStatement(sql);
			movieps.setString(1,movieName);
			movieps.setString(2,movieType);
			movieps.setInt(3,movieID);
			int num = movieps.executeUpdate();
			tm = new Movie();
			if(num==1) 
			{
				tm.setStatus(66);
			}
			else{
				tm.setStatus(99);
			}
			if(pstmt != null) pstmt.close();
			this.closeConn();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.closeAll();
		}
		return tm;
	}
}
