package com.ibm.automation.core.bean;

public class RemoteServerBean {
	private int account_id;
	private String server_ip;
	private String account;
	private String password;//明文
	private String enpassword;//密文
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getServer_ip() {
		return server_ip;
	}
	public void setServer_ip(String server_ip) {
		this.server_ip = server_ip;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEnpassword() {
		return enpassword;
	}
	public void setEnpassword(String enpassword) {
		this.enpassword = enpassword;
	}
	
}
