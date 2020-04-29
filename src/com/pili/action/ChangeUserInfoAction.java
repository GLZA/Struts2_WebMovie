package com.pili.action;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pili.dao.UserDao;
import com.pili.pojo.User;

public class ChangeUserInfoAction extends ActionSupport 
implements SessionAware,ModelDriven<User>{
	private User user = new User();
	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) 
	{ 
		this.session = session;
	}
	public String updateUserInfo(){
		UserDao userDao = new UserDao();
		user = userDao.changeUserInfo(user.getUserID(), user.getNickName(), user.getBornDate(), user.getSex(), user.getEmail(), user.getUsername());
		if(user != null) {
			user.setBorn(user.getBornDate());
			session.put("user", user);
		}
		return SUCCESS;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}
