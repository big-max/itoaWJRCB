package com.ibm.automation.domain;

public class Task_All_InfoBean extends Task_InstanceBean {
    private String expected_endtime;
    private String expected_starttime;
    private String expected_duration;
	public String getExpected_endtime() {
		return expected_endtime;
	}
	public void setExpected_endtime(String expected_endtime) {
		this.expected_endtime = expected_endtime;
	}
	public String getExpected_starttime() {
		return expected_starttime;
	}
	public void setExpected_starttime(String expected_starttime) {
		this.expected_starttime = expected_starttime;
	}
	public String getExpected_duration() {
		return expected_duration;
	}
	public void setExpected_duration(String expected_duration) {
		this.expected_duration = expected_duration;
	}
}
