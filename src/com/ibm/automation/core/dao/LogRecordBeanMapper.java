package com.ibm.automation.core.dao;

import java.util.List;

import com.ibm.automation.domain.LogRecordBean;

public interface LogRecordBeanMapper {
	List<LogRecordBean> selectLogRecords();
}
