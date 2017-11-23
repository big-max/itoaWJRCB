package com.ibm.automation.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.automation.core.remotedao.password_readMapper;
import com.ibm.automation.core.remotedao.server_account_passwordMapper;
import com.ibm.automation.core.service.RemotePasswordService;
import com.ibm.automation.domain.AccountPasswd;
import com.ibm.automation.domain.ServerAccountPassword;
import com.isearch.IseDesEncrypt;

@Service("remotePasswordServiceImpl")
public class RemotePasswordServiceImpl implements RemotePasswordService {

	
	@Autowired
	password_readMapper password_read;
	@Autowired
	server_account_passwordMapper server_account;
	
	@Override
	public void copyPasswordtoLocalFromRemote() {
		List<ServerAccountPassword> serverAccount = server_account.selectAll();
		password_read.deleteAll();
		for(int i = 0; i < serverAccount.size(); i++){
			AccountPasswd accountPasswd = new AccountPasswd();
			accountPasswd.setAccount(serverAccount.get(i).getAccount());
			accountPasswd.setAccountId(serverAccount.get(i).getAccountId());
			accountPasswd.setEnpassword(serverAccount.get(i).getPassword());
			accountPasswd.setServerIp(serverAccount.get(i).getServerIp());
			accountPasswd.setPassword(IseDesEncrypt.getDesString(serverAccount.get(i).getPassword()));
			password_read.insert(accountPasswd);
		}
	}
	
}
