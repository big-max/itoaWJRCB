package com.ibm.automation.core.dao;

import com.ibm.automation.domain.RunPastBean;

public interface RunPastBeanMapper {
	 RunPastBean selectRZRunDatetime(String dagId);
}
