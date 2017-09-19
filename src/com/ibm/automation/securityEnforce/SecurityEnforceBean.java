package com.ibm.automation.securityEnforce;

import java.io.Serializable;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.automation.core.bean.ServersBean;

public class SecurityEnforceBean implements Serializable, Comparable<SecurityEnforceBean>{
	private ObjectMapper om = new ObjectMapper();
	
	private String uuid;
	private String param_opt_value;
	private int param_opt_result;
	private String param_toptea_value;
	private int param_toptea_result;
	private String param_anoftp_value;
	private int param_anoftp_result;
	private String param_timeout_value;
	private int param_timeout_result;
	private String template_name;
	private String create_time;
	private String user;
	private String func;
	private String detail;
	
	@Override
	public int compareTo(SecurityEnforceBean s) {
		// TODO Auto-generated method stub
		return s.getUuid().compareTo(this.getUuid()) == 0 ? this.getTemplate_name().compareTo(s.getTemplate_name())
				: s.getUuid().compareTo(this.getUuid());
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getParam_opt_value() {
		return param_opt_value;
	}

	public void setParam_opt_value(String param_opt_value) {
		this.param_opt_value = param_opt_value;
	}

	public int getParam_opt_result() {
		return param_opt_result;
	}

	public void setParam_opt_result(int param_opt_result) {
		this.param_opt_result = param_opt_result;
	}

	public String getParam_toptea_value() {
		return param_toptea_value;
	}

	public void setParam_toptea_value(String param_toptea_value) {
		this.param_toptea_value = param_toptea_value;
	}

	public int getParam_toptea_result() {
		return param_toptea_result;
	}

	public void setParam_toptea_result(int param_toptea_result) {
		this.param_toptea_result = param_toptea_result;
	}

	public String getParam_anoftp_value() {
		return param_anoftp_value;
	}

	public void setParam_anoftp_value(String param_anoftp_value) {
		this.param_anoftp_value = param_anoftp_value;
	}

	public int getParam_anoftp_result() {
		return param_anoftp_result;
	}

	public void setParam_anoftp_result(int param_anoftp_result) {
		this.param_anoftp_result = param_anoftp_result;
	}

	public String getParam_timeout_value() {
		return param_timeout_value;
	}

	public void setParam_timeout_value(String param_timeout_value) {
		this.param_timeout_value = param_timeout_value;
	}

	public int getParam_timeout_result() {
		return param_timeout_result;
	}

	public void setParam_timeout_result(int param_timeout_result) {
		this.param_timeout_result = param_timeout_result;
	}

	public String getTemplate_name() {
		return template_name;
	}

	public void setTemplate_name(String template_name) {
		this.template_name = template_name;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
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

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	
}
