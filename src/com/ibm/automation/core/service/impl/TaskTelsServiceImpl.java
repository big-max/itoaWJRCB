package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.dao.TaskTelsBeanMapper;
import com.ibm.automation.core.service.TaskTelsService;
import com.ibm.automation.domain.TaskTelsBean;

@Service("taskTelsService")
public class TaskTelsServiceImpl implements TaskTelsService {

	@Autowired
	private TaskTelsBeanMapper taskTelsBeanMapper;

	@Override
	public List<TaskTelsBean> getAllTaskTels() {
		List<TaskTelsBean> tasktelslist = taskTelsBeanMapper.selectAllTaskTels();
		return tasktelslist;
	}

	@Override
	public List<TaskTelsBean> selectTelsByTaskID(String task_id) {
		// TODO Auto-generated method stub
		taskTelsBeanMapper.selectTelsByTaskID(task_id);
		return null;
	}

	@Override
	public int addTaskTels(List<TaskTelsBean> lttb) throws DuplicateKeyException{
		int id = taskTelsBeanMapper.addTaskTels(lttb);
		return id;
	}

	@Override
	public void deleteTaskTels(int[] ids) {
		taskTelsBeanMapper.deleteTaskTelsByID(ids);
		//return 0;
	}

	@Override
	public int modifyTaskTels(TaskTelsBean ttb) {
		// TODO Auto-generated method stub
		int x = taskTelsBeanMapper.modifyTaskTels(ttb);
		return x;
	}
	
}
