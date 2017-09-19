package com.ibm.automation.securityEnforce;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

public class SecurityJobSummaryBean implements Serializable, Comparable<SecurityJobSummaryBean>{
	private ObjectMapper om = new ObjectMapper();
	
	private String id;
	private int status;
	private String security_template;
	private String uuid;
	private String exectime;
	private int job_type;
	private String detail;
	private String user;
	private String func;
	private List<String> ip_list;
	private String summary;
	
	@Override
	public int compareTo(SecurityJobSummaryBean s) {
		// TODO Auto-generated method stub
		return s.getUuid().compareTo(this.getUuid()) == 0 ? this.getId().compareTo(s.getId())
				: s.getUuid().compareTo(this.getUuid());
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSecurity_template() {
		return security_template;
	}

	public void setSecurity_template(String security_template) {
		this.security_template = security_template;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getExectime() {
		return exectime;
	}

	public void setExectime(String exectime) {
		this.exectime = exectime;
	}

	public int getJob_type() {
		return job_type;
	}

	public void setJob_type(int job_type) {
		this.job_type = job_type;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getFunc() {
		return func;
	}

	public void setFunc(String func) {
		this.func = func;
	}

	public List<String> getIp_list() {
		return ip_list;
	}

	public void setIp_list(List<String> ip_list) {
		this.ip_list = ip_list;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	
}
