package com.pili.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pili.dao.UserDao;
import com.pili.pojo.User;



public class LoginaAndRegAction extends ActionSupport implements SessionAware , ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2886913994014343223L;
	private User user = new User();
	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) 
	{ 
		this.session = session;
	}
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	public String login() {
		UserDao userDao = new UserDao();
		User u = userDao.login(user.getUsername(), user.getPassword());
		System.out.println(u.getUsername());
		if(u != null) {
			session.put("user", u);
			
			return SUCCESS;
		
		}else{
			session.put("loginError","�û��������벻��ȷ��");
			return ERROR;
		}
	}
	public String register() {
		UserDao userDao = new UserDao();
		User u = userDao.register(user.getUsername(),user.getPassword());
		if(u.getStatus()==1) {
			session.put("user",u);
			return SUCCESS;
		}else {
			return ERROR;
		}
	}
	
}
