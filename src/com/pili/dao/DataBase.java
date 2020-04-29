package com.pili.dao;

import java.sql.*;
public class DataBase {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://kaiyu.work:3306/pili?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=GMT%2B8&useSSL=false";
    static final String USER = "root";
    static final String PASS = "LYY&css1314";
    
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
   
    public void getConnection() {
		// TODO Auto-generated method stub
		try{
			
			Class.forName(JDBC_DRIVER);
			this.conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public Connection getConn(){
		if(conn == null) 
			this.getConnection();
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStmt() {
		try{
			this.stmt = this.conn.createStatement();
		}catch(Exception e){
			e.printStackTrace();
		}
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public PreparedStatement getPstmt() {
		return pstmt;
	}

	public void setPstmt(PreparedStatement pstmt) {
		this.pstmt = pstmt;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public void closeConn(){
		try {
			if(conn != null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void closeStmt(){
		try {
			if(stmt != null){
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void closeAll(){
		try {
			if(rs != null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(pstmt != null){
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
