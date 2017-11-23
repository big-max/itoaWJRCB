package com.ibm.automation.domain;

public class AccountPasswd {
	 	private Integer accountId;

	    private String serverIp;

	    private String account;

	    private String enpassword;

	    private String password;

	    public Integer getAccountId() {
	        return accountId;
	    }

	    public void setAccountId(Integer accountId) {
	        this.accountId = accountId;
	    }

	    public String getServerIp() {
	        return serverIp;
	    }

	    public void setServerIp(String serverIp) {
	        this.serverIp = serverIp == null ? null : serverIp.trim();
	    }

	    public String getAccount() {
	        return account;
	    }

	    public void setAccount(String account) {
	        this.account = account == null ? null : account.trim();
	    }

	    public String getEnpassword() {
	        return enpassword;
	    }

	    public void setEnpassword(String enpassword) {
	        this.enpassword = enpassword == null ? null : enpassword.trim();
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password == null ? null : password.trim();
	    }
}
