package com.ibm.automation.domain;



public class publish_recordBean {
	private Integer id;

	private String publishTime;

	private String publishType;

	private String publishNode;

	private String publishUser;

	private String publishStatus;

	private String publishLog;
	
	private String publishVersion;
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public String getPublishType() {
		return publishType;
	}

	public void setPublishType(String publishType) {
		this.publishType = publishType == null ? null : publishType.trim();
	}

	public String getPublishNode() {
		return publishNode;
	}

	public void setPublishNode(String publishNode) {
		this.publishNode = publishNode == null ? null : publishNode.trim();
	}

	public String getPublishUser() {
		return publishUser;
	}

	public void setPublishUser(String publishUser) {
		this.publishUser = publishUser == null ? null : publishUser.trim();
	}

	public String getPublishStatus() {
		return publishStatus;
	}

	public void setPublishStatus(String publishStatus) {
		this.publishStatus = publishStatus == null ? null : publishStatus.trim();
	}

	public String getPublishLog() {
		return publishLog;
	}

	public void setPublishLog(String publishLog) {
		this.publishLog = publishLog == null ? null : publishLog.trim();
	}

	public String getPublishVersion() {
		return publishVersion;
	}

	public void setPublishVersion(String publishVersion) {
		this.publishVersion = publishVersion;
	}
	
}