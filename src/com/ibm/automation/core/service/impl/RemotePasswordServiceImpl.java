package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.bean.RemoteServerBean;
import com.ibm.automation.core.dao.ServerAccountPasswordMapper;
import com.ibm.automation.core.service.RemotePasswordService;
import com.isearch.IseDesEncrypt;

@Service("remotePasswordService")
public class RemotePasswordServiceImpl implements RemotePasswordService {
	//用于操作本地数据库
	@Autowired
	ServerAccountPasswordMapper sapMapper;
	
	@Override
	public void copyPasswordtoLocalFromRemote(List<RemoteServerBean> list) {
		
		sapMapper.deleteAll(); //删除所有本地数据
			
		for(int i = 0; i < list.size(); i++){
			sapMapper.insert(list.get(i));
		}
	}
	
}
