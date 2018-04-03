package com.ibm.automation.domain;

import java.io.Serializable;
import java.util.Date;

public class BackupServer implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -6346324243858876383L;

	private Integer id;

    private String type;

    private String ip;

    private String version;

    private Date lastSycTime;

    private String lastSycMode;

    private String manageUrl;
    
    private String user;
    
    private String passwd;
    
    public BackupServer(){
    	super();
    }
    
    public BackupServer(String type, String ip, String version, String user, String passwd){
    	super();
    	this.type = type;
    	this.ip = ip;
    	this.version = version;
    	this.user = user;
    	this.passwd = passwd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public Date getLastSycTime() {
        return lastSycTime;
    }

    public void setLastSycTime(Date lastSycTime) {
        this.lastSycTime = lastSycTime;
    }

    public String getLastSycMode() {
        return lastSycMode;
    }

    public void setLastSycMode(String lastSycMode) {
        this.lastSycMode = lastSycMode == null ? null : lastSycMode.trim();
    }

    public String getManageUrl() {
        return manageUrl;
    }

    public void setManageUrl(String manageUrl) {
        this.manageUrl = manageUrl == null ? null : manageUrl.trim();
    }

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
}
