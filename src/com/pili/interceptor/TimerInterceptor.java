package com.pili.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/*
 * 计算执行Action花费的时间
 */
public class TimerInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2088426610357365567L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		
		long start = System.currentTimeMillis();
		
		String result = invocation.invoke();
		
		long end = System.currentTimeMillis();
		
		System.out.println("执行Action花费的时间："+(end-start)+"ms");
		
		return result;
	}

}
