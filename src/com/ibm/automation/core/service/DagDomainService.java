package com.ibm.automation.core.service;

import java.util.List;

import com.ibm.automation.domain.DagDomainBean;

public interface DagDomainService {
	
	public List<DagDomainBean> getAllDagDomain();
	public DagDomainBean getDagDomain(String id);
}
