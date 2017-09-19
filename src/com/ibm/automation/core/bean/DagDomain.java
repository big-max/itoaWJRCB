package com.ibm.automation.core.bean;

import java.util.Date;

//触发任务的bean 
public class DagDomain {
	private String dag_id; // 哪个任务
	private String dag_alias;//dag中文名
	private String owners; // 责任人
	private Date last_run_date;// 最近运行日期
	private String last_run_status;// 最近运行状态
	private int dag_status;//当前状态   0 未开始 1 运行中 2 暂停 3 失败
	private String dag_hispage; // 历史
	private String dag_runpage;// 当前运行状态
	private String dag_refresh;//刷新页面
	
	
	public String getDag_id() {
		return dag_id;
	}
	public void setDag_id(String dag_id) {
		this.dag_id = dag_id;
	}
	public String getDag_alias() {
		return dag_alias;
	}
	public void setDag_alias(String dag_alias) {
		this.dag_alias = dag_alias;
	}
	public String getOwners() {
		return owners;
	}
	public void setOwners(String owners) {
		this.owners = owners;
	}
	
	public Date getLast_run_date() {
		return last_run_date;
	}
	public void setLast_run_date(Date last_run_date) {
		this.last_run_date = last_run_date;
	}
	public String getLast_run_status() {
		return last_run_status;
	}
	public void setLast_run_status(String last_run_status) {
		this.last_run_status = last_run_status;
	}
	public String getDag_refresh() {
		return dag_refresh;
	}
	public void setDag_refresh(String dag_refresh) {
		this.dag_refresh = dag_refresh;
	}
	public int getDag_status() {
		return dag_status;
	}
	public void setDag_status(int dag_status) {
		this.dag_status = dag_status;
	}
	public String getDag_hispage() {
		return dag_hispage;
	}
	public void setDag_hispage(String dag_hispage) {
		this.dag_hispage = dag_hispage;
	}
	public String getDag_runpage() {
		return dag_runpage;
	}
	public void setDag_runpage(String dag_runpage) {
		this.dag_runpage = dag_runpage;
	}
	
	
	
}
