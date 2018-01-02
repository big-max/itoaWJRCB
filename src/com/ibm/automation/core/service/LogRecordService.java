package com.ibm.automation.core.service;

import java.util.List;

import com.ibm.automation.domain.DagDomainBean;
import com.ibm.automation.domain.LogRecordBean;

public interface LogRecordService {
	
	public List<LogRecordBean> getAllLogRecords();
	
}
