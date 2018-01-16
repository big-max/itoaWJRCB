package com.ibm.automation.core.dao;

import java.util.List;

import com.ibm.automation.domain.TaskParamBean;

public interface TaskParamBeanMapper {
	List<TaskParamBean> selectAllTaskParams();
}
