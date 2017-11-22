package com.ibm.automation.dailyflow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils.Null;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.autoswitch.controller.AutoSwitchController;
import com.ibm.automation.core.service.DagDomainService;
import com.ibm.automation.core.service.DagRunService;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.service.Task_InstanceService;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.UtilDateTime;
import com.ibm.automation.domain.Task_InstanceBean;

import net.sf.json.JSONArray;

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
	Properties rzprop = PropertyUtil.getResourceFile("config/properties/rzdate.properties");
	ObjectMapper om = new ObjectMapper();
	
	@RequestMapping("/dailyflow.do")
	public String dailyflow(HttpServletRequest request, HttpSession session) {
		return "dailyflow/instance_rz_summary";
	}
	
	@RequestMapping("/dailyRunningPage.do")
	public String dailyrunning_page(@RequestParam Map<String, String> dag, Model model) {
		String exe_time_str = dag.get("execution_date");
		String link = null;
		if( null != exe_time_str){
			String[] exe_time= exe_time_str.split("T");
			String[] exe_mon_day = exe_time[0].split("-");
			
			model.addAttribute("execution_date", exe_time_str);
			
			String execution_time = exe_mon_day[1]+"-"+exe_mon_day[2];
			logger.info("month is " + exe_mon_day[1] + "; day is " + exe_mon_day[2]);
			//获取配置文件中结息和年终的日期(格式：month-day)
			String jxString = rzprop.getProperty("jiexi");
			String nzString = rzprop.getProperty("nianzhong");
			
			String[] jxdate = jxString.split(",");
			String[] nzdate = nzString.split(",");
			
			for(int i = 0; i < jxdate.length; i++){
				if(jxdate[i].equals(execution_time)){
					link = "dailyflow/instance_rz_jiexi_running";
					break;
				}
			}
			for(int j = 0; j < nzdate.length; j++){
				if(nzdate[j].equals(execution_time)){
					link = "dailyflow/instance_rz_nianzhong_running";
					break;
				}
			}
			
			if(link == null){
				link = "dailyflow/instance_rz_pingshi_running";
			}
		}else {
			link ="dailyflow/instance_rz_summary";
		}
		
		return link;
	}
}
