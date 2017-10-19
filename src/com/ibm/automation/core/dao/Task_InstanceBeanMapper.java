package com.ibm.automation.core.dao;

import java.util.List;
import java.util.Map;

import com.ibm.automation.domain.Task_All_InfoBean;
import com.ibm.automation.domain.Task_InstanceBean;

public interface Task_InstanceBeanMapper {
	List<Task_InstanceBean> selectRunningTaskInstance(Map<String,String> map);
	List<Task_All_InfoBean> selectHistoryTaskInstance(Map<String,String> map);
	String getStateOfTask(Map<String, String> map);
}