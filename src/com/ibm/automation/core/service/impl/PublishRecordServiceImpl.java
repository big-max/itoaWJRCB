package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.dao.publish_recordBeanMapper;
import com.ibm.automation.core.service.PublishRecordService;
import com.ibm.automation.domain.publish_recordBean;

@Service("publishRecordService")
public class PublishRecordServiceImpl implements PublishRecordService {

	@Autowired
	public publish_recordBeanMapper publish_recordbeanMapper;
	@Override
	public List<publish_recordBean> getAllPubRecords() {
		return publish_recordbeanMapper.selectAllRecords();
	}

}
