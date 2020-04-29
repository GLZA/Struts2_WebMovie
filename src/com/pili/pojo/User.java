package com.pili.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class User {

	private String username;
	private String password;
	private String tip;
	private int userID;
	private int status;
	private String nickName;
	private String sex;
	private Date bornDate;
	private String born;
	public String getBorn() {
		return born;
	}
	public void setBorn(Date date) {
		String born = (new SimpleDateFormat("yyyy-MM-dd")).format(date);//将页面中的Date型转换成String型
		this.born = born;
	}
	private String email;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBornDate() {
		return bornDate;
	}
	public void setBornDate(Date bornDate) {
		this.bornDate = bornDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
