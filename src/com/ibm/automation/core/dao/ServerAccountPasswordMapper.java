package com.ibm.automation.core.dao;

import com.ibm.automation.core.bean.RemoteServerBean;

public interface ServerAccountPasswordMapper {
	//插入所有从堡垒机抄过来的记录
    int insert(RemoteServerBean record);
    //删除表内所有数据
    int deleteAll();
}
