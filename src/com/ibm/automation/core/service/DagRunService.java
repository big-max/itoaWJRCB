package com.ibm.automation.core.service;

import java.util.List;

import com.ibm.automation.domain.DagRunBean;

public interface DagRunService {
	public List<DagRunBean> getDagRunTime(String dag_id);
}
