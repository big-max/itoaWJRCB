package com.ibm.automation.core.controller;

import net.people2000.ikeyauth.IkeyAuthImpl;
import net.people2000.ikeyauth.IkeyAuthInterfaces;

public class KeyAuth {
	public static int auth(int type, String name, String password) {
		String host = ""; // IP：8080
		int connectTimeOut = 30 * 1000; // 连接超时时间
		int readTimeOut = 30 * 1000; // 读取超时时间
		IkeyAuthInterfaces ikey = new IkeyAuthImpl(host, connectTimeOut, readTimeOut);
		System.out.println("返回码为:"+ikey);
		try {
			ikey.ikeyAuth(type, name, password, "");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("认证失败，请重试！,失败原因为：" + e.getMessage());
		}
		return 1;
	}
}
