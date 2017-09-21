package com.ibm.automation.domain;


//每跑一次DAG会产生一条条目
public class DagRunBean {

    private String dag_id;

    private String execution_date;

    private String state;

    private String run_id;

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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRun_id() {
		return run_id;
	}

	public void setRun_id(String run_id) {
		this.run_id = run_id;
	}

   

    
}