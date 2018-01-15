package com.ibm.automation.domain;

public class TaskTelsBean {
	private int id;
	private String task_id;
	private String name;// 工号
	private String tel;// 电话

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

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\",\"task_id\":\"" + task_id + "\",\"name\":\"" + name + "\",\"tel\":\"" + tel
				+ "\"} ";
	}
}
