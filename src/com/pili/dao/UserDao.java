package com.pili.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.pili.pojo.User;

public class UserDao extends DataBase implements SessionAware{

	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
		
	}
	public User login(String username,String password){
		User user = null;
		String sql = "select * from user where username = ? and password = ?";
		Connection Userconn = this.getConn();
		try {
			
			PreparedStatement Userps = Userconn.prepareStatement(sql);
			
			Userps.setString(1,username);
			Userps.setString(2,password);
			
			ResultSet rs = Userps.executeQuery();
			
			if(rs != null && rs.next()){
				user = new User();
				user.setUserID(rs.getInt("userID"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setStatus(1);
				user.setNickName(rs.getString("Nickname"));
				user.setEmail(rs.getString("Email"));
				user.setSex(rs.getString("Sex"));
				
				SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
				
				Date date = null;
				try{
					if(rs.getString("Born")!=null) {
						date = simpleDateFormat.parse(rs.getString("Born"));
						user.setBornDate(date);
						user.setBorn(date);
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//灏嗘暟鎹簱涓幏鍙栫殑鏃ユ湡浠嶴tring鍨嬭浆鎹㈠埌Date鍨�
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
		return user;
	}
	public User register(String username,String password){
		int flag = 0;
		User user = null;
		String sql = "select * from user where username = ?";
		Connection Userconn = this.getConn();
		try {
			
			PreparedStatement Userps = Userconn.prepareStatement(sql);
			
			Userps.setString(1,username);
			
			ResultSet rs = Userps.executeQuery();
			user = new User();
			if(rs != null && rs.next()){
				//濡傛灉宸叉湁姝ょ敤鎴峰垯銆傘�傘�傘�傘��
				user.setStatus(2);
			}
			else{
				sql="insert into user(userID,username,password) values(userID,?,?)";
				Userps = Userconn.prepareStatement(sql);
				Userps.setString(1,username);
				Userps.setString(2,password);
				flag = Userps.executeUpdate();
				if(flag == 1) {
					System.out.println("good");
					sql = "select * from user where username = ?";
					Userps = Userconn.prepareStatement(sql);
					Userps.setString(1,username);
					ResultSet rss  = Userps.executeQuery();
					if(rss != null && rss.next()){
						user.setStatus(1);
						user.setUserID(rss.getInt("userID"));
						user.setUsername(rss.getString("username"));
						user.setPassword(rss.getString("password"));
					}
				}
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
		return user;
	}
	public User selectUser(String username) {
		User user = null;
		String sql = "select * from user where username = ?";
		Connection Userconn = this.getConn();
		try {
			
			PreparedStatement Userps = Userconn.prepareStatement(sql);
			
			Userps.setString(1,username);
			
			ResultSet rs = Userps.executeQuery();
			
			if(rs != null && rs.next()){
				
				user = new User();
				user.setUserID(rs.getInt("userID"));
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
		return user;
	}
	public User securityUser(String username,String password) {
		User user = null;
		String sql ="update user set password = ? where username = ?";
		Connection Userconn = this.getConn();
		try {
			
			PreparedStatement Userps = Userconn.prepareStatement(sql);
			Userps.setString(1,password);
			Userps.setString(2,username);
			int i = Userps.executeUpdate();
			if(i==1){
				user = new User();
				user.setStatus(1);
			}
			else {
				user = new User();
				user.setStatus(0);
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
		return user;
	}
	public User changeUserInfo(int userID,String nickName,Date bornDate,String sex,String email, String username){
		User user = null;
		Connection Userconn = this.getConn();
		try {
			String born = (new SimpleDateFormat("yyyy-MM-dd")).format(bornDate);//灏嗛〉闈腑鑾峰彇鐨凞ate鍨嬭浆鎹㈡垚String鍨嬪瓨鏀惧埌鏁版嵁搴撲腑
			String sql = "UPDATE `user` SET `Nickname`='"+nickName+"', `Born`='"+born+"', `Sex`='"+sex+"', `Email`='"+email+"' WHERE (`userID`='"+userID+"')";
			Statement state = Userconn.createStatement();
			state.execute(sql);
			user = new User();
			user.setUserID(userID);
			user.setNickName(nickName);
			user.setSex(sex);
			user.setEmail(email);
			user.setUsername(username);
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");//鏃ユ湡鏍煎紡
			try {
				Date date=simpleDateFormat.parse(born);//灏嗘暟鎹簱涓幏鍙栫殑鏃ユ湡浠嶴tring鍨嬭浆鎹㈠埌Date鍨�
				user.setBornDate(date);
			} catch(ParseException px) {
				px.printStackTrace();
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
		return user;
	}
}
