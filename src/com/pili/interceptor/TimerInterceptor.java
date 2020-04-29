package com.pili.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/*
 * ����ִ��Action���ѵ�ʱ��
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
		
		System.out.println("ִ��Action���ѵ�ʱ�䣺"+(end-start)+"ms");
		
		return result;
	}

}
