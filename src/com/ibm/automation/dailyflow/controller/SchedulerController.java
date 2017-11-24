package com.ibm.automation.dailyflow.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;

import com.ibm.automation.core.bean.RemoteServerBean;
import com.ibm.automation.core.service.RemotePasswordService;
import com.ibm.automation.core.util.PropertyUtil;
import com.isearch.IseDesEncrypt;

public class SchedulerController {
    Properties jdbcprop = PropertyUtil.getResourceFile("config/properties/jdbc.properties");
	
	@Autowired
	private RemotePasswordService remotePasswordService;
	
	public  void updateTaskInfoExpectedTime()
	{
		System.out.println("i am running update ....");
		List<RemoteServerBean> list = getServerInfoFromRemote();
		remotePasswordService.copyPasswordtoLocalFromRemote(list);
	}
	
	public  List<RemoteServerBean> getServerInfoFromRemote() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = (String) jdbcprop.get("jdbc.remote.url");
		String user = (String) jdbcprop.getProperty("jdbc.remote.username");
		String password = (String) jdbcprop.getProperty("jdbc.remote.password");
		List<RemoteServerBean> list = new ArrayList<RemoteServerBean>();

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			String sql = "select * from server_account_passwd";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RemoteServerBean rsb = new RemoteServerBean();
				rsb.setAccount_id(rs.getInt("account_id"));
				rsb.setServer_ip(rs.getString("server_ip"));
				rsb.setAccount(rs.getString("account"));
				rsb.setEnpassword(rs.getString("password"));// 密文
				rsb.setPassword(IseDesEncrypt.getDesString(rs.getString("password")));// 明文
				list.add(rsb);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
