package com.pili.action;

import com.opensymphony.xwork2.ActionSupport;

public class HelloWorldAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String execute() throws Exception {
		System.out.println("Ö´ÐÐAction");
		return SUCCESS;
	}
	public String add() 
	{
		return "add";
	}
	public String delete() 
	{
		return "delete";
	}
	public String update() 
	{
		return "update";
	}

	
}
