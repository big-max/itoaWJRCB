package com.ibm.automation.securityEnforce;

import java.io.Serializable;
import java.util.List;

public class SecurityEnforceOutlineBean implements Serializable, Comparable<SecurityEnforceOutlineBean>{

	private int status;
	private String security_template;
	private String uuid;
	private String exectime;
	private int job_type;
	private String user;
	private String func;
	private List<String> ip_list;
	private int correctnum;
	private int incorrectnum;
	private int totalnum;
	
	@Override
	public int compareTo(SecurityEnforceOutlineBean s) {
		return s.getuuid().compareTo(this.getuuid()) == 0 ? this.getexectime().compareTo(s.getexectime())
				: s.getuuid().compareTo(this.getuuid());
	}

	
	
	
	public int getCorrectnum() {
		return correctnum;
	}




	public void setCorrectnum(int correctnum) {
		this.correctnum = correctnum;
	}




	public int getIncorrectnum() {
		return incorrectnum;
	}




	public void setIncorrectnum(int incorrectnum) {
		this.incorrectnum = incorrectnum;
	}




	public int getTotalnum() {
		return totalnum;
	}




	public void setTotalnum(int totalnum) {
		this.totalnum = totalnum;
	}




	public int getstatus() {
		return status;
	}

	public void setstatus(int status) {
		this.status = status;
	}

	public String getsecurity_template() {
		return security_template;
	}

	public void setsecurity_template(String security_template) {
		this.security_template = security_template;
	}

	public String getuuid() {
		return uuid;
	}

	public void setuuid(String uuid) {
		this.uuid = uuid;
	}

	public String getexectime() {
		return exectime;
	}

	public void setexectime(String exectime) {
		this.exectime = exectime;
	}

	public int getjob_type() {
		return job_type;
	}

	public void setjob_type(int job_type) {
		this.job_type = job_type;
	}

	public String getuser() {
		return user;
	}

	public void setuser(String user) {
		this.user = user;
	}

	public String getfunc() {
		return func;
	}

	public void setfunc(String func) {
		this.func = func;
	}

	public List<String> getip_list() {
		return ip_list;
	}

	public void setip_list(List<String> ip_list) {
		this.ip_list = ip_list;
	}
	
	
	
	
}
