package com.ibm.automation.dailyflow.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.ibm.automation.core.service.RemotePasswordService;

public class SchedulerController {
	@Autowired
	RemotePasswordService remotePasswordServiceImpl;
	
	public void updateTaskInfoExpectedTime(){
		System.out.println("updateTaskInfoExpectedTime, now is : " + new Date());
		remotePasswordServiceImpl.copyPasswordtoLocalFromRemote();
	}
}
