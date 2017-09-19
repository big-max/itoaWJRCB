package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.dao.DagDomainBeanMapper;
import com.ibm.automation.core.service.DagDomainService;
import com.ibm.automation.domain.DagDomainBean;

@Service("dagDomainService")
public class DagDomainServiceImpl implements DagDomainService {
	
	@Autowired
	private DagDomainBeanMapper dagDomainBeanMapper ; 
	public List<DagDomainBean> getAllDagDomain()
	{
		return dagDomainBeanMapper.selectAllDagDomain();
		//return null;
	}
	@Override
	public DagDomainBean getDagDomain(String id) {
		// TODO Auto-generated method stub
		return dagDomainBeanMapper.selectDagByID(id);
	}
}
