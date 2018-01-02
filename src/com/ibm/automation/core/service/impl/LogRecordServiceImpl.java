package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.dao.LogRecordBeanMapper;
import com.ibm.automation.core.service.LogRecordService;
import com.ibm.automation.domain.LogRecordBean;

@Service("logRecordService")
public class LogRecordServiceImpl implements LogRecordService{

	@Autowired
	private LogRecordBeanMapper logRecordBeanMapper;
	@Override
	public List<LogRecordBean> getAllLogRecords() {
		return logRecordBeanMapper.selectLogRecords();
	}

}
