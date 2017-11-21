package com.ibm.automation.dailyflow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	// 运行时页面ajax
	@RequestMapping("/pingshi_runningData.do")
	@ResponseBody
	public ObjectNode dagrunning_data(HttpServletRequest request, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		String dag_id = request.getParameter("dag_id");
		// 2016-01-01T12:12:12 to 2016-01-01 12:12:12
		String execution_date = UtilDateTime.T2Datetime(request.getParameter("execution_date"));
		//System.out.println(execution_date + " -- " + dag_id);
		map.put("dag_id", dag_id);
		map.put("execution_date", execution_date);// "2017-09-13
		List<Task_InstanceBean> taskInstanceList = task_InstanceService.getRunningTaskInstance(map);
		logger.info("获取到的task个数是" + taskInstanceList.size());
		JSONArray array = JSONArray.fromObject(taskInstanceList);
		ObjectNode on = om.createObjectNode();
		on.put("dag_id", dag_id);
		on.putPOJO("dag_tasks", array);
		//System.out.println(on.toString());
		return on;
	}
	
	@RequestMapping("/dailyflow.do")
	public String dailyflow(HttpServletRequest request, HttpSession session) {
		return "dailyflow/instance_rz_summary";
	}
	
	@RequestMapping("/dailyRunningPage.do")
	public String dailyrunning_page(HttpServletRequest request, HttpSession session) {
		String date_md = request.getParameter("date_md");
		//获取配置文件中结息和年终的日期(格式：month-day)
		String jxString = rzprop.getProperty("jiexi");
		String nzString = rzprop.getProperty("nianzhong");
		
		String[] jxdate = jxString.split(",");
		String[] nzdate = nzString.split(",");
		
		
		String link = null;
		
		for(int i = 0; i < jxdate.length; i++){
			if(jxdate[i].equals(date_md)){
				link = "dailyflow/instance_rz_jiexi_running";
				break;
			}
		}
		for(int j = 0; j < nzdate.length; j++){
			if(nzdate[j].equals(date_md)){
				link = "dailyflow/instance_rz_nianzhong_running";
				break;
			}
		}
		
		if(link == null){
			link = "dailyflow/instance_rz_pingshi_running";
		}
		
		return link;
	}
}
