package com.ibm.automation.remoteCommand.controller;

public class RemoteCommandBean {
	private String uuid;
	private String targetIP;//目标机器
	private String exeTime;//执行时间
	private String user;//执型用户
	private String command;//执行命令
	private String status;//1 运行中 2 完成
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
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
