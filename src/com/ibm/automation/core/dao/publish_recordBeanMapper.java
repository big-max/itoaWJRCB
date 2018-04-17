package com.ibm.automation.core.dao;

import java.util.List;

import com.ibm.automation.domain.publish_recordBean;

public interface publish_recordBeanMapper {
	public List<publish_recordBean> selectAllRecords();
}