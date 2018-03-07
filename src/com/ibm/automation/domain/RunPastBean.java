package com.ibm.automation.domain;

public class RunPastBean {
	private String dag_id;
	private String execution_date;
	private int is_auto;
	public String getDag_id() {
		return dag_id;
	}
	public void setDag_id(String dag_id) {
		this.dag_id = dag_id;
	}
	public String getExecution_date() {
		return execution_date;
	}
	public void setExecution_date(String execution_date) {
		this.execution_date = execution_date;
	}
	public int getIs_auto() {
		return is_auto;
	}
	public void setIs_auto(int is_auto) {
		this.is_auto = is_auto;
	}
	
}
