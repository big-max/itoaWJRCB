package com.ibm.automation.domain;

public class TaskParamBean {
	private String task_id;

	public String getTask_id() {
		return task_id;
	}

	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}

	@Override
	public String toString() {
		return "{\"task_id\":\"" + task_id + "\"} ";
	}
	
}
