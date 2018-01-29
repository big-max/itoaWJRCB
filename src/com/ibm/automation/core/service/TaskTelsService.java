package com.ibm.automation.core.service;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;

import com.ibm.automation.domain.TaskTelsBean;

public interface TaskTelsService {
	public List<TaskTelsBean> getAllTaskTels(); 
	public List<TaskTelsBean> selectTelsByTaskID(String task_id);
	//public int deleteTaskTelsByID(int id);
	int modifyTaskTels(TaskTelsBean ttb);
	
	int addTaskTels(List<TaskTelsBean> lttb) throws DuplicateKeyException;
	void deleteTaskTels(int[] ids);
}
