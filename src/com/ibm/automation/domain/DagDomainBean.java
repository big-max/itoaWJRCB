package com.ibm.automation.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DagDomainBean {
	private String dag_id;

	private String dag_alias;

	private String owners;

	private String last_run_date;

	private String last_run_status;

	private String dag_hispage;

	private String dag_runpage;

	private Integer dag_status;

	private String dag_refresh;

	private int is_paused;

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

	public String getLast_run_date() {

		return last_run_date;
	}

	public void setLast_run_date(String last_run_date) {
		this.last_run_date = last_run_date;
	}

	public String getLast_run_status() {
		return last_run_status;
	}

	public void setLast_run_status(String last_run_status) {
		this.last_run_status = last_run_status;
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

	public Integer getDag_status() {
		return dag_status;
	}

	public void setDag_status(Integer dag_status) {
		this.dag_status = dag_status;
	}

	public String getDag_refresh() {
		return dag_refresh;
	}

	public void setDag_refresh(String dag_refresh) {
		this.dag_refresh = dag_refresh;
	}

	public int getIs_paused() {
		return is_paused;
	}

	public void setIs_paused(int is_paused) {
		this.is_paused = is_paused;
	}

	@Override
	public String toString() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formatDateString = "";
		if (last_run_date != null) {
			formatDateString = sdf.format(last_run_date);
		}
		return "DagDomainBean [dag_id=" + dag_id + ", dag_alias=" + dag_alias + ", owners=" + owners
				+ ", last_run_date=" + formatDateString + ", last_run_status=" + last_run_status + ", dag_hispage="
				+ dag_hispage + ", dag_runpage=" + dag_runpage + ", dag_status=" + dag_status + ", dag_refresh="
				+ dag_refresh + ",is_paused = " + is_paused + "]";
	}

}