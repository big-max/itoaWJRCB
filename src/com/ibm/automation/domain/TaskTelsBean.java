package com.ibm.automation.domain;

public class TaskTelsBean {
	private int id;
	private String task_id;
	private String name;// 工号
	private String tel;// 电话
	private String status;//开始、成功、失败
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTask_id() {
		return task_id;
	}

	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\",\"task_id\":\"" + task_id + "\",\"name\":\"" + name + "\",\"tel\":\"" + tel
				+ "\",\"status\":\"" + status + "\"} ";
	}

	
}
