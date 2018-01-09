package com.ibm.automation.dailyflow.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.LogRecordService;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.UtilDateTime;
import com.ibm.automation.domain.LogRecordBean;
import com.sun.org.apache.xml.internal.security.utils.Base64;

import net.sf.json.JSONObject;

@Controller
public class DailyFlowController {
	@Autowired
	private ServerService service;
	@Autowired
	private LogRecordService logRecordService;
	private static Logger logger = Logger.getLogger(DailyFlowController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	Properties rzprop = PropertyUtil.getResourceFile("config/properties/rzdate.properties");
	ObjectMapper om = new ObjectMapper();
	
	@RequestMapping("/dailyflow.do")
	public String dailyflow(HttpServletRequest request, HttpSession session) {
		 String czy = (String)session.getAttribute("czy");
		 
		 System.out.println(czy);
		 List<LogRecordBean> list = logRecordService.getAllLogRecords();
		 request.setAttribute("logRecordList", list);
		 return "dailyflow/instance_rz_summary";
	}
	
	@RequestMapping("/dailyRunningPage.do")
	public String dailyrunning_page(@RequestParam Map<String, String> dag, Model model) {
		String exe_time_str = dag.get("execution_date");
		String link = null;
		if( null != exe_time_str){
			String[] exe_time= null;
			exe_time = exe_time_str.split("T");
			String[] exe_mon_day = null;
			exe_mon_day = exe_time[0].split("-");
			
			model.addAttribute("execution_date", exe_time_str);
			logger.info("exe_time_str is" + exe_time_str);
			String execution_time = null;
			execution_time = exe_mon_day[1]+"-"+exe_mon_day[2];
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
				link = "dailyflow/instance_dailyflow_rz_running";
			}
		}else {
			link ="dailyflow/instance_rz_summary";
		}
		
		return link;
	}
	
	
	@RequestMapping("/getSubPage.do")
	public String getSubPage(HttpServletRequest request, HttpSession session) {
		return "dailyflow/instance_dailyflow_dj_sub";
	}
	
	@RequestMapping("/getSubPageHistory.do")
	public String getSubPageHistory(HttpServletRequest request, HttpSession session) {
		return "dailyflow/instance_dailyflow_dj_sub_history";
	}
	
	@RequestMapping("/dailyHistoryPage.do")
	public String dailyHistoryPage(HttpServletRequest request, HttpSession session) {
		return "dailyflow/instance_dailyflow_rz_history";
	}
	
	
	// who do what at 9.00pm detail is ""
	//记录用户的输入日志
	@RequestMapping("postLogRecord.do")
	@ResponseBody
	public JSONObject postLogRecord(HttpServletRequest req ,HttpSession session)
	{
		// 获取用户名
		String userName = (String)session.getAttribute("userName");
		// 获取当前时间
		String currentDatetime = UtilDateTime.getFormatCurrentDate();
		// 获取当前任务名
		String task_id = req.getParameter("task_id"); //任务id
		String dag_id = req.getParameter("dag_id");//流程名
		String execution_date = req.getParameter("execution_date");//流程执行时间
		String task_detail = req.getParameter("task_detail");//任务描述
											  
		ObjectNode postJson = om.createObjectNode();
		postJson.put("dag_id", dag_id);
		postJson.put("task_id", task_id);
		postJson.put("username",userName);
		postJson.put("add_datetime", currentDatetime);
		postJson.put("execution_date", execution_date);
		postJson.put("task_detail", Base64.encode(task_detail.getBytes()));  //记录员添加的描述
		postJson.put("operation", 11); // 发起一个添加任务出错修复信息的日志
		
		String url = service.createSendUrl(PropertyKeyConst.AMS2_HOST, PropertyKeyConst.POST_ams2_common);
		try {
			String response = HttpClientUtil.postMethod(url, postJson.toString());
			return JSONObject.fromObject(response);
		} catch (NetWorkException | IOException e) {
			e.printStackTrace();
			logger.error("发起灾备过程中IO错误");
		}
		return null;
	}
	public static void main(String[] args) {
		String s = UtilDateTime.getFormatCurrentDate();
		System.out.println(s);
	}
}
