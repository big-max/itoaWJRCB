package com.ibm.automation.core.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


/**
 * @author hujin
 * 
 */
public class LoginBean extends BaseBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2658986328332422393L;
	private String username;//账号
	private String password;//密码
	private String email;//邮箱
	private List<Integer> role;  //1 admin   |   0 operator
	private String tel;//电话
	private String czy;//操作员
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCzy() {
		return czy;
	}

	public void setCzy(String czy) {
		this.czy = czy;
	}

	private List<String> proList;
	public LoginBean()
	{
		this.proList=new ArrayList<String>();
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {

		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public List<Integer> getRole() {
		return role;
	}

	public void setRole(List<Integer> role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<String> getProList() {
		return proList;
	}

	public void setProList(List<String> proList) {
		this.proList = proList;
	}
	
}
