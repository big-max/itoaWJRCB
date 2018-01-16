package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.dao.TaskParamBeanMapper;
import com.ibm.automation.core.service.TaskParamService;
import com.ibm.automation.domain.TaskParamBean;

@Service
public class TaskParamServiceImpl implements TaskParamService {

	@Autowired
	private TaskParamBeanMapper taskParamBeanMapper;

	@Override
	public List<TaskParamBean> getAllTaskParams() {
		return taskParamBeanMapper.selectAllTaskParams();
	}

}
