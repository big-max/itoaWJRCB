package com.ibm.automation.core.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ibm.automation.core.dao.Task_InstanceBeanMapper;
import com.ibm.automation.core.service.Task_InstanceService;
import com.ibm.automation.domain.Task_All_InfoBean;
import com.ibm.automation.domain.Task_InstanceBean;

@Service("task_InstanceService")
public class Task_InstanceServiceImpl implements Task_InstanceService {

	@Autowired
	Task_InstanceBeanMapper task_instanceBeanMapper;
	@Override
	public List<Task_InstanceBean> getRunningTaskInstance(Map<String,String> map) {
		return task_instanceBeanMapper.selectRunningTaskInstance(map);
	}
	@Override
	public List<Task_All_InfoBean> getHistoryTaskInstance(Map<String, String> map) {
		return task_instanceBeanMapper.selectHistoryTaskInstance(map);
	}
	@Override
	public String getStateOfTask(Map<String, String> map) {
		return task_instanceBeanMapper.getStateOfTask(map);
	}
}
