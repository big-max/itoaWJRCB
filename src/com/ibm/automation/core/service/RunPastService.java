package com.ibm.automation.core.service;

import com.ibm.automation.domain.RunPastBean;

public interface RunPastService {
	RunPastBean getRZRunDatetime(String dag_id);
}
