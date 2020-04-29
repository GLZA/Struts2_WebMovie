package com.pili.json;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pili.dao.UserDao;
import com.pili.pojo.User;

public class JsonAction extends ActionSupport 
implements SessionAware , ModelDriven<User>{

	private static final long serialVersionUID = 1L;
	private User user = new User();
	private Map<String, Object> session;
	public void setSession(Map<String, Object> session) 
	{ 
		this.session = session;
	}
	public String select() {
		UserDao userDao = new UserDao();
		User u = userDao.selectUser(user.getUsername());
		try {
			if (u == null) {
				user.setTip( "你好! " + user.getUsername() + ",此用户名可用! ");
				user.setStatus(1);
			} else {
				user.setTip("系统中已有" + user.getUsername() + "用户名，请重新选择一个！");
				user.setStatus(0);
			}
		} catch (Exception e) {
			user.setTip(e.getMessage());
		}
		//session.put("tip", tip);
		return SUCCESS;
	}
	public String reg() {
		UserDao userDao = new UserDao();
		User u = userDao.register(user.getUsername(),user.getPassword());
		if(u.getStatus()==1) {
			user.setStatus(u.getStatus());
			user.setTip("注册成功");
			session.put("user",u);
			return SUCCESS;
		}else if(u.getStatus()==2) 
		{
			user.setTip("有相同用户名，请重新注册");
			return ERROR;
		}
		else {
			user.setTip("服务器错误");
			return ERROR;
		}
	}
	public String login() {
		
		UserDao userDao = new UserDao();
		User u = userDao.login(user.getUsername(),user.getPassword());
		if(u != null) {
			System.out.println("yes");
			user.setStatus(u.getStatus());
			session.put("user", u);
			return SUCCESS;

		}else {
			return ERROR;
		}
	}
public String security() {
		
		UserDao userDao = new UserDao();
		User u = userDao.securityUser(user.getUsername(),user.getPassword());
		if(u.getStatus()==1) {
			System.out.println("yes");
			user.setTip("##修改成功##");
			return SUCCESS;

		}else {
			user.setTip("##修改失败##");
			return ERROR;
		}
	}


	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}
