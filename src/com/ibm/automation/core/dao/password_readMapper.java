package com.ibm.automation.core.dao;

import com.ibm.automation.domain.AccountPasswd;

public interface password_readMapper {
	//插入所有从堡垒机抄过来的记录
    int insert(AccountPasswd record);
    //删除表内所有数据
    int deleteAll();
}