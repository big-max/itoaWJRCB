package com.ibm.automation.fixLoad.controller;

public class fixLoadBean {
	private String uuid;
	private String targetIP;//选择IP
	private String exeTime;//执行时间
	private String user;//执型用户
	private String detail;
	private String status;//1 运行中 2 完成
	private String url;//
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getTargetIP() {
		return targetIP;
	}
	public void setTargetIP(String targetIP) {
		this.targetIP = targetIP;
	}
	public String getExeTime() {
		return exeTime;
	}
	public void setExeTime(String exeTime) {
		this.exeTime = exeTime;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}

}
