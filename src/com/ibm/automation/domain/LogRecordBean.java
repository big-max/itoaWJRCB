package com.ibm.automation.domain;

public class LogRecordBean {
	private String username;
	private String dag_id;
	private String task_id;
	private String execution_date;
	private String add_datetime;
	private String task_detail;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDag_id() {
		return dag_id;
	}
	public void setDag_id(String dag_id) {
		this.dag_id = dag_id;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getExecution_date() {
		return execution_date;
	}
	public void setExecution_date(String execution_date) {
		this.execution_date = execution_date;
	}
	public String getAdd_datetime() {
		return add_datetime;
	}
	public void setAdd_datetime(String add_datetime) {
		this.add_datetime = add_datetime;
	}
	public String getTask_detail() {
		return task_detail;
	}
	public void setTask_detail(String task_detail) {
		this.task_detail = task_detail;
	}
	
}
