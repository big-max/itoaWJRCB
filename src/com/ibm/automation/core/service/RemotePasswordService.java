package com.ibm.automation.core.service;

import java.util.List;

import com.ibm.automation.core.bean.RemoteServerBean;

public interface RemotePasswordService {
	
	public void copyPasswordtoLocalFromRemote(List<RemoteServerBean> list);

}
