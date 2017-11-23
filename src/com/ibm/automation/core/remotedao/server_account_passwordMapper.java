package com.ibm.automation.core.remotedao;

import java.util.List;

import com.ibm.automation.domain.ServerAccountPassword;

public interface server_account_passwordMapper {
	//获取所有堡垒机中密码表数据
    List<ServerAccountPassword> selectAll();
    
}