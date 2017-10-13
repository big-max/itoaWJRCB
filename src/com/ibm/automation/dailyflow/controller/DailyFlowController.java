package com.ibm.automation.dailyflow.controller;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.autoswitch.controller.AutoSwitchController;
import com.ibm.automation.core.service.DagDomainService;
import com.ibm.automation.core.service.DagRunService;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.service.Task_InstanceService;
import com.ibm.automation.core.util.PropertyUtil;

@Controller
public class DailyFlowController {
	@Autowired
	private ServerService service;
	@Autowired
	private AmsRestService amsRestService;
	@Autowired
	private Task_InstanceService task_InstanceService;
	private static Logger logger = Logger.getLogger(DailyFlowController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	ObjectMapper om = new ObjectMapper();
	
	@RequestMapping("/dailyflow.do")
	public String dailyflow(HttpServletRequest request, HttpSession session) {
		return "dailyflow/instance_dailyflow_running";
	}
}
