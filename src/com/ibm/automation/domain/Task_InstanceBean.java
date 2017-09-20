package com.ibm.automation.domain;

import java.util.Date;

//任务实例封装
public class Task_InstanceBean {
	private String task_id;
	private String dag_id;
	private String execution_date;
    private String start_Date;
    private String end_Date;
    private Float duration;
    private String state;
    private Integer try_number;
    private String hostname;
    private String unixname;
    private Integer job_id;
    private String pool;
    private String queue;
    private Integer priority_weight;
    private String operator;
    private String queued_dttm;
    private Integer pid;
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
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
	public String getStart_Date() {
		return start_Date;
	}
	public void setStart_Date(String start_Date) {
		this.start_Date = start_Date;
	}
	public String getEnd_Date() {
		return end_Date;
	}
	public void setEnd_Date(String end_Date) {
		this.end_Date = end_Date;
	}
	public String getQueued_dttm() {
		return queued_dttm;
	}
	public void setQueued_dttm(String queued_dttm) {
		this.queued_dttm = queued_dttm;
	}
	public Float getDuration() {
		return duration;
	}
	public void setDuration(Float duration) {
		this.duration = duration;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getTry_number() {
		return try_number;
	}
	public void setTry_number(Integer try_number) {
		this.try_number = try_number;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getUnixname() {
		return unixname;
	}
	public void setUnixname(String unixname) {
		this.unixname = unixname;
	}
	public Integer getJob_id() {
		return job_id;
	}
	public void setJob_id(Integer job_id) {
		this.job_id = job_id;
	}
	public String getPool() {
		return pool;
	}
	public void setPool(String pool) {
		this.pool = pool;
	}
	public String getQueue() {
		return queue;
	}
	public void setQueue(String queue) {
		this.queue = queue;
	}
	public Integer getPriority_weight() {
		return priority_weight;
	}
	public void setPriority_weight(Integer priority_weight) {
		this.priority_weight = priority_weight;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}

   
}