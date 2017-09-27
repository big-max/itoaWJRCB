package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.dao.DagRunBeanMapper;
import com.ibm.automation.core.service.DagRunService;
import com.ibm.automation.domain.DagRunBean;

@Service("dagRunService")
public class DagRunServiceImpl implements DagRunService {

	@Autowired
	private DagRunBeanMapper dagRunBeanMapper;

	@Override
	public List<DagRunBean> getDagRunTime(String dag_id) {
		return dagRunBeanMapper.selectDagRunTime(dag_id);
	}

	@Override
	public List<DagRunBean> selectLastDagRunInstance() {
		return dagRunBeanMapper.selectLastDagRunInstance();
	}
	
	

}
