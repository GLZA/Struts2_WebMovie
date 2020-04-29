package com.pili.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pili.pojo.User;

public class ExitAction extends ActionSupport
implements SessionAware , ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8649200637570636677L;
	private Map<String, Object> session;
	private User user = new User();
	public String execute() throws Exception {
		try {
			
			if(session.isEmpty()==false) {
				session.clear();
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}

	
	public User getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
}
