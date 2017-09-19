package com.ibm.automation.securityEnforce;

import java.io.Serializable;

public class SecurityEnforceSummaryBean implements Serializable, Comparable<SecurityEnforceSummaryBean>{
	
	private int status;
	private String uuid;
	private int stdout_status;
	private int stdout_detail_opt_result;
	private String stdout_detail_opt_value;
	private int stdout_detail_umask_result;
	private String stdout_detail_umask_value;
	private String stdout_detail_nofile_value;
	private int stdout_detail_nofile_result;
	private int stdout_detail_ano_ftp_result;
	private String stdout_detail_ano_ftp_value;
	private int stdout_detail_timeout_result;
	private String stdout_detail_timeout_value;
	private int stdout_detail_toptea_result;
	private String stdout_detail_toptea_value;
	private String ip;
	private String summary;
	private String run_uuid;
	@Override
	public int compareTo(SecurityEnforceSummaryBean s) {
		return s.getuuid().compareTo(this.getuuid()) == 0 ? this.getrun_uuid().compareTo(s.getrun_uuid())
				: s.getuuid().compareTo(this.getuuid());
	}
	public int getstatus() {
		return status;
	}
	public void setstatus(int status) {
		this.status = status;
	}
	public String getuuid() {
		return uuid;
	}
	public void setuuid(String uuid) {
		this.uuid = uuid;
	}
	public int getstdout_status() {
		return stdout_status;
	}
	public void setstdout_status(int stdout_status) {
		this.stdout_status = stdout_status;
	}
	public int getstdout_detail_opt_result() {
		return stdout_detail_opt_result;
	}
	public void setstdout_detail_opt_result(int stdout_detail_opt_result) {
		this.stdout_detail_opt_result = stdout_detail_opt_result;
	}
	public String getstdout_detail_opt_value() {
		return stdout_detail_opt_value;
	}
	public void setstdout_detail_opt_value(String stdout_detail_opt_value) {
		this.stdout_detail_opt_value = stdout_detail_opt_value;
	}
	public int getstdout_detail_umask_result() {
		return stdout_detail_umask_result;
	}
	public void setstdout_detail_umask_result(int stdout_detail_umask_result) {
		this.stdout_detail_umask_result = stdout_detail_umask_result;
	}
	public String getstdout_detail_umask_value() {
		return stdout_detail_umask_value;
	}
	public void setstdout_detail_umask_value(String stdout_detail_umask_value) {
		this.stdout_detail_umask_value = stdout_detail_umask_value;
	}
	public String getstdout_detail_nofile_value() {
		return stdout_detail_nofile_value;
	}
	public void setstdout_detail_nofile_value(String stdout_detail_nofile_value) {
		this.stdout_detail_nofile_value = stdout_detail_nofile_value;
	}
	public int getstdout_detail_nofile_result() {
		return stdout_detail_nofile_result;
	}
	public void setstdout_detail_nofile_result(int stdout_detail_nofile_result) {
		this.stdout_detail_nofile_result = stdout_detail_nofile_result;
	}
	public int getstdout_detail_ano_ftp_result() {
		return stdout_detail_ano_ftp_result;
	}
	public void setstdout_detail_ano_ftp_result(int stdout_detail_ano_ftp_result) {
		this.stdout_detail_ano_ftp_result = stdout_detail_ano_ftp_result;
	}
	public String getstdout_detail_ano_ftp_value() {
		return stdout_detail_ano_ftp_value;
	}
	public void setstdout_detail_ano_ftp_value(String stdout_detail_ano_ftp_value) {
		this.stdout_detail_ano_ftp_value = stdout_detail_ano_ftp_value;
	}
	public int getstdout_detail_timeout_result() {
		return stdout_detail_timeout_result;
	}
	public void setstdout_detail_timeout_result(int stdout_detail_timeout_result) {
		this.stdout_detail_timeout_result = stdout_detail_timeout_result;
	}
	public String getstdout_detail_timeout_value() {
		return stdout_detail_timeout_value;
	}
	public void setstdout_detail_timeout_value(String stdout_detail_timeout_value) {
		this.stdout_detail_timeout_value = stdout_detail_timeout_value;
	}
	public int getstdout_detail_toptea_result() {
		return stdout_detail_toptea_result;
	}
	public void setstdout_detail_toptea_result(int stdout_detail_toptea_result) {
		this.stdout_detail_toptea_result = stdout_detail_toptea_result;
	}
	public String getstdout_detail_toptea_value() {
		return stdout_detail_toptea_value;
	}
	public void setstdout_detail_toptea_value(String stdout_detail_toptea_value) {
		this.stdout_detail_toptea_value = stdout_detail_toptea_value;
	}
	public String getip() {
		return ip;
	}
	public void setip(String ip) {
		this.ip = ip;
	}
	public String getsummary() {
		return summary;
	}
	public void setsummary(String summary) {
		this.summary = summary;
	}
	public String getrun_uuid() {
		return run_uuid;
	}
	public void setrun_uuid(String run_uuid) {
		this.run_uuid = run_uuid;
	}
	
	
}
