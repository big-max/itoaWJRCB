package com.ibm.automation.core.service;

import java.util.List;

import com.ibm.automation.domain.TaskTelsBean;

public interface TaskTelsService {
	public List<TaskTelsBean> getAllTaskTels(); 
	public List<TaskTelsBean> selectTelsByTaskID(String task_id);
	//public int deleteTaskTelsByID(int id);
	//int modifyTaskTels();
	
	int addTaskTels(List<TaskTelsBean> lttb);
}
