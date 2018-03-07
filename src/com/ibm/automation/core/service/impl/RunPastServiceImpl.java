package com.ibm.automation.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.dao.RunPastBeanMapper;
import com.ibm.automation.core.service.RunPastService;
import com.ibm.automation.domain.RunPastBean;

@Service("runPastService")
public class RunPastServiceImpl implements RunPastService{
	@Autowired
	private RunPastBeanMapper runPastBeanMapper;
	
	@Override
	public RunPastBean getRZRunDatetime(String dag_id) {
		RunPastBean rpb = runPastBeanMapper.selectRZRunDatetime(dag_id);
		return rpb;
	}

}
