package com.ibm.automation.autoswitch.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.DagDomainService;
import com.ibm.automation.core.service.DagRunService;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.service.Task_InstanceService;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.domain.DagDomainBean;
import com.ibm.automation.domain.DagRunBean;
import com.ibm.automation.domain.Task_InstanceBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AutoSwitchController {
	@Autowired
	private ServerService service;
	@Autowired
	private AmsRestService amsRestService;
	@Autowired
	private DagDomainService dagDomainService;
	@Autowired
	private DagRunService dagRunService;
	@Autowired
	private Task_InstanceService task_InstanceService;
	private static Logger logger = Logger.getLogger(AutoSwitchController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	ObjectMapper om = new ObjectMapper();

	@RequestMapping("/autoswitch.do")
	public String autoswitch(HttpServletRequest request, HttpSession session) {
		List<DagDomainBean> dagDomainList = dagDomainService.getAllDagDomain();

		DagDomainBean ddb = dagDomainService.getDagDomain("pprc");
		System.out.println(ddb);
		request.setAttribute("taskList", dagDomainList);
		return "instance_autoswitch_summary";
	}

	// 到运行时页面
	@RequestMapping("/runningPage.do")
	public String dagrunning_page(HttpServletRequest request, HttpSession session) {
		String dag_id = "pprc_go";
		String link = null;
		switch (dag_id) {
		case "pprc_go":
			link = "instance_autoswitch_pprc_go_running";
			break;
		case "pprc_back":
			link = "instance_autoswitch_pprc_back_running";
			break;
		default :
			link = null;
		}

		return link;
	}

	// 运行时页面ajax
	@RequestMapping("/runningData.do")
	@ResponseBody
	public ObjectNode dagrunning_data(HttpServletRequest request, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		String dag_id = request.getParameter("dag_id");
		String execution_date = request.getParameter("execution_date");
		map.put("dag_id", dag_id);
		map.put("execution_date", execution_date);// "2017-09-13
													// 19:42:47.000000"
		List<Task_InstanceBean> taskInstanceList = task_InstanceService.getRunningTaskInstance(map);
		JSONArray array = JSONArray.fromObject(taskInstanceList);
		System.out.println(array);
		ObjectNode on = om.createObjectNode();
		on.put("dag_id", dag_id);
		on.putPOJO("dag_tasks", array);
		return on;
	}

	// 历史页面数据ajax
	@RequestMapping("/historyData.do")
	@ResponseBody
	public ObjectNode daghistory_data(HttpServletRequest request, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		String dag_id = request.getParameter("dag_id");
		String execution_date = request.getParameter("execution_date");
		map.put("dag_id", dag_id);
		map.put("execution_date", execution_date);// "2017-09-13
													// 19:42:47.000000"
		List<Task_InstanceBean> taskInstanceList = task_InstanceService.getRunningTaskInstance(map);
		JSONArray array = JSONArray.fromObject(taskInstanceList);
		System.out.println(array);
		ObjectNode on = om.createObjectNode();
		on.put("dag_id", dag_id);
		on.putPOJO("dag_tasks", array);
		return on;
	}

	// 到历史记录页面
	@RequestMapping("/historyPage.do")
	public String daghistoryPage(@RequestParam Map<String, String> dag, Model model) {
		String dagid = dag.get("dagid");
        String dagtime = dag.get("dagtime"); 
        model.addAttribute("dagid", dagid);
        model.addAttribute("dagtime", dagtime);
        
		return "instance_autoswitch_history";
	}

	// 获取历史数据的某个dig的所有执行时间
	@RequestMapping("/historyDatatime.do")
	@ResponseBody
	public ObjectNode daghistoryDatatime(HttpServletRequest request, HttpSession session) {
		String dag_id = request.getParameter("dag_id");

		List<DagRunBean> allDatetimeList = dagRunService.getDagRunTime(dag_id);
		ObjectNode on = om.createObjectNode();
		ArrayNode an = om.createArrayNode();
		for (int i = 0; i < allDatetimeList.size(); i++) {
			an.addPOJO(allDatetimeList.get(i).getExecution_date());
		}
		on.put("dag_id", dag_id);
		on.putPOJO("dag_hisdatetime", an);
		return on;
	}
	/*
	 * {"pprc_go":[]}
	 * 
	 * 
	 */

	// 发出灾备切换请求
	@RequestMapping("/postRunAirflow.do")
	@ResponseBody
	public JSONObject postRun(HttpServletRequest request, HttpSession session) {
		String dag_id = request.getParameter("dag_id");

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");// 设置日期格式

		ObjectNode postJson = om.createObjectNode();
		postJson.put("dag_id", dag_id);
		postJson.put("execution_date", df.format(new Date()));
		postJson.put("operation", 3); // 3 代表run airflow
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

	// 发出灾备切换暂停/继续请求
	@RequestMapping("/postPauseAirflow.do")
	public JSONObject postPause(HttpServletRequest request, HttpSession session) {
		String dag_id = request.getParameter("dag_id");
		int onoff = Integer.valueOf(request.getParameter("switch"));// 0 打开1暂停
		ObjectNode postJson = om.createObjectNode();
		postJson.put("dag_id", dag_id);
		postJson.put("operation", 5); // 5代表暂停指定airflow
		postJson.put("switch", onoff);
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

	// 发出灾备切换停止请求
	@RequestMapping("/postStopAirflow.do")
	public String postStop(HttpServletRequest request, HttpSession session) {
		return null;
	}
	
	public void test(){
		System.out.println("test");
	}
}
