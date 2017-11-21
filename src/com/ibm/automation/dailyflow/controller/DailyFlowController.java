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
		return "dailyflow/instance_rz_summary";
	}
	
	@RequestMapping("/dailyRunningPage.do")
	public String dailyrunning_page(HttpServletRequest request, HttpSession session) {
		String current_dag_id = request.getParameter("current_dag_id");
		String link = null;
		switch (current_dag_id) {
		case "dayend_daily":
			link = "dailyflow/instance_rz_pingshi_running";
			break;
		case "dayend_jiexi":
			link = "dailyflow/instance_rz_jiexi_running";
			break;
		case "dayend_year":
			link = "dailyflow/instance_rz_nianzhong_running";
			break;
		default:
			link = null;
		}
		return link;
	}
}
