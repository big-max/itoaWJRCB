package com.ibm.automation.core.service;

import java.util.List;
import java.util.Map;

import com.ibm.automation.domain.Task_All_InfoBean;
import com.ibm.automation.domain.Task_InstanceBean;

public interface Task_InstanceService {
	public List<Task_InstanceBean> getRunningTaskInstance(Map<String,String> map);
	public List<Task_All_InfoBean> getHistoryTaskInstance(Map<String,String> map);
	public String getStateOfTask(Map<String,String>map);
}	
