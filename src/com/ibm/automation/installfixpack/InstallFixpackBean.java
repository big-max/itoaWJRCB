package com.ibm.automation.installfixpack;

import java.io.Serializable;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.core.bean.ServersBean;

public class InstallFixpackBean implements Serializable, Comparable<InstallFixpackBean>{
	public static Logger logger = Logger.getLogger(ServersBean.class);

	private String uuid;
	private String fixpack_name;
	private String target_ips;
	private String fixpack_version;
	private String run_time;
	private String operator;
	private String job_log;
	private String run_status;
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getFixpack_name() {
		return fixpack_name;
	}
	public void setFixpack_name(String plugin_name) {
		this.fixpack_name = plugin_name;
	}
	public String getTarget_ips() {
		return target_ips;
	}
	public void setTarget_ips(String target_ips) {
		this.target_ips = target_ips;
	}
	public String getFixpack_version() {
		return fixpack_version;
	}
	public void setFixpack_version(String plugin_version) {
		this.fixpack_version = plugin_version;
	}
	public String getRun_time() {
		return run_time;
	}
	public void setRun_time(String run_time) {
		this.run_time = run_time;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getJob_log() {
		return job_log;
	}
	public void setJob_log(String job_log) {
		this.job_log = job_log;
	}
	public String getRun_status() {
		return run_status;
	}
	public void setRun_status(String run_status) {
		this.run_status = run_status;
	}
	
	private ObjectMapper om = new ObjectMapper();
	
	@Override
	public int compareTo(InstallFixpackBean s) {
		// TODO Auto-generated method stub
		return s.getUuid().compareTo(this.getUuid()) == 0 ? this.getFixpack_name().compareTo(s.getFixpack_name())
				: s.getUuid().compareTo(this.getUuid());
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		ObjectNode oServer = om.createObjectNode();
		oServer.put("fixpack_name", this.getFixpack_name());
		oServer.put("target_ips", this.getTarget_ips());
		oServer.put("fixpack_version", this.getFixpack_version());
		oServer.put("run_time", this.getRun_time());
		oServer.put("operator", this.getOperator());
		oServer.put("job_log", this.getJob_log());
		oServer.put("run_status", this.getRun_status());
		String retVal = null;
		try {
			retVal = om.writeValueAsString(oServer);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.debug("InstallFixpackBean::" + e.getMessage());
			return null;
		}
		return retVal;
	}
	
	
}
