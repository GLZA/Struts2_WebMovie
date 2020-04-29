package com.pili.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4010935298434039223L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		if(session.get("user")!=null) {
			String result = invocation.invoke();
			return result;
		}else {
			return "login";
		}
	}

}
