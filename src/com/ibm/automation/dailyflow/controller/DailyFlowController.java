package com.ibm.automation.dailyflow.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.LogRecordService;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.service.TaskParamService;
import com.ibm.automation.core.service.TaskTelsService;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.UtilDateTime;
import com.ibm.automation.domain.LogRecordBean;
import com.ibm.automation.domain.TaskParamBean;
import com.ibm.automation.domain.TaskTelsBean;
import com.sun.org.apache.xml.internal.security.utils.Base64;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class DailyFlowController {
	@Autowired
	private ServerService service;
	@Autowired
	private LogRecordService logRecordService;
	@Autowired
	private TaskParamService taskParamService;
	@Autowired
	private TaskTelsService taskTelsService;
	@Autowired
	private AmsRestService amsRestService;
	private static Logger logger = Logger.getLogger(DailyFlowController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	Properties rzprop = PropertyUtil.getResourceFile("config/properties/rzdate.properties");
	ObjectMapper om = new ObjectMapper();

	@RequestMapping("/dailyflow.do")
	public String dailyflow(HttpServletRequest request, HttpSession session) {
		String czy = (String) session.getAttribute("czy");

		List<LogRecordBean> list = logRecordService.getAllLogRecords();
		request.setAttribute("logRecordList", list);
		return "dailyflow/instance_rz_summary";
	}

	@RequestMapping("/dailyRunningPage.do")
	public String dailyrunning_page(@RequestParam Map<String, String> dag, Model model) {
		String exe_time_str = dag.get("execution_date");
		String link = null;
		if (null != exe_time_str) {
			String[] exe_time = null;
			exe_time = exe_time_str.split("T");
			String[] exe_mon_day = null;
			exe_mon_day = exe_time[0].split("-");

			model.addAttribute("execution_date", exe_time_str);
			logger.info("exe_time_str is" + exe_time_str);
			String execution_time = null;
			execution_time = exe_mon_day[1] + "-" + exe_mon_day[2];
			logger.info("month is " + exe_mon_day[1] + "; day is " + exe_mon_day[2]);
			// 获取配置文件中结息和年终的日期(格式：month-day)
			String jxString = rzprop.getProperty("jiexi");
			String nzString = rzprop.getProperty("nianzhong");

			String[] jxdate = jxString.split(",");
			String[] nzdate = nzString.split(",");

			for (int i = 0; i < jxdate.length; i++) {
				if (jxdate[i].equals(execution_time)) {
					link = "dailyflow/instance_rz_jiexi_running";
					break;
				}
			}
			for (int j = 0; j < nzdate.length; j++) {
				if (nzdate[j].equals(execution_time)) {
					link = "dailyflow/instance_rz_nianzhong_running";
					break;
				}
			}

			if (link == null) {
				link = "dailyflow/instance_dailyflow_rz_running";
			}
		} else {
			link = "dailyflow/instance_rz_summary";
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
	public String dailyHistoryPage(@RequestParam Map<String, String> dag, Model model) {
		/*
		 * String dag_id = dag.get("dag_id"); model.addAttribute("dag_id",
		 * dag_id); System.out.println(UtilDateTime.T2Datetime(execution_date));
		 * model.addAttribute("execution_date",
		 * UtilDateTime.T2Datetime(execution_date)); return
		 * "dailyflow/instance_dailyflow_rz_history";
		 */

		String exe_time_str = dag.get("execution_date");
		String link = null;
		if (null != exe_time_str) {
			String[] exe_time = null;
			exe_time = exe_time_str.split("T");
			String[] exe_mon_day = null;
			exe_mon_day = exe_time[0].split("-");

			model.addAttribute("execution_date", exe_time_str);
			logger.info("exe_time_str is" + exe_time_str);
			String execution_time = null;
			execution_time = exe_mon_day[1] + "-" + exe_mon_day[2];
			logger.info("month is " + exe_mon_day[1] + "; day is " + exe_mon_day[2]);
			// 获取配置文件中结息和年终的日期(格式：month-day)
			String jxString = rzprop.getProperty("jiexi");
			String nzString = rzprop.getProperty("nianzhong");

			String[] jxdate = jxString.split(",");
			String[] nzdate = nzString.split(",");

			for (int i = 0; i < jxdate.length; i++) {
				if (jxdate[i].equals(execution_time)) {
					link = "dailyflow/instance_rz_jiexi_history";
					break;
				}
			}
			for (int j = 0; j < nzdate.length; j++) {
				if (nzdate[j].equals(execution_time)) {
					link = "dailyflow/instance_rz_nianzhong_history";
					break;
				}
			}

			if (link == null) {
				link = "dailyflow/instance_dailyflow_rz_history";
			}
		} else {
			link = "dailyflow/instance_rz_summary";
		}

		return link;

	}

	// who do what at 9.00pm detail is ""
	// 记录用户的输入日志
	@RequestMapping("postLogRecord.do")
	@ResponseBody
	public JSONObject postLogRecord(HttpServletRequest req, HttpSession session) {
		// 获取用户名
		String userName = (String) session.getAttribute("userName");
		// 获取当前时间
		String currentDatetime = UtilDateTime.getFormatCurrentDate();
		// 获取当前任务名
		String task_id = req.getParameter("task_id"); // 任务id
		String dag_id = req.getParameter("dag_id");// 流程名
		String execution_date = req.getParameter("execution_date");// 流程执行时间
		String task_detail = req.getParameter("task_detail");// 任务描述

		ObjectNode postJson = om.createObjectNode();
		postJson.put("dag_id", dag_id);
		postJson.put("task_id", task_id);
		postJson.put("username", userName);
		postJson.put("add_datetime", currentDatetime);
		postJson.put("execution_date", execution_date);
		postJson.put("task_detail", Base64.encode(task_detail.getBytes())); // 记录员添加的描述
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

	@RequestMapping("/dailyEditMessage.do")
	public String dailyEditMessage(HttpServletRequest request, HttpSession session) {
		return "dailyflow/instance_rz_edit_message";
	}

	// 获取日终，工号，手机号，任务的对应关系
	@RequestMapping("/getdailysms.do")
	@ResponseBody
	public JSONArray getTaskSMSID() {
		List<TaskTelsBean> mylist = taskTelsService.getAllTaskTels();
		JSONArray array = JSONArray.fromObject(mylist);
		for (int i = 0; i < array.size(); i++) {
			JSONObject ob = (JSONObject) array.get(i);
			String status = ob.getString("status");
			String newstatus = status.replace("1", "开始").replace("2", "成功").replace("3", "失败");
			ob.put("status", newstatus);
		}
		return array;

	}

	// 添加发送手机号的员工
	@RequestMapping("adddailysms.do")
	@ResponseBody
	public ObjectNode adddailySMS(HttpServletRequest request) throws Exception {
		String task_id = request.getParameter("task_id");// 任务名
		String[] names = request.getParameterValues("name"); // nametel 工号:电话
		String[] status = request.getParameterValues("status");// 开始、成功、失败
		List<TaskTelsBean> taskTelList = new ArrayList<TaskTelsBean>();
		for (String name : names) {
			TaskTelsBean ttb = new TaskTelsBean();
			String[] nametel = name.split(":");//
			ttb.setName(nametel[0]);
			ttb.setTask_id(task_id);
			ttb.setTel(nametel[1]);
			ttb.setStatus(StringUtils.join(status, ","));
			taskTelList.add(ttb);
		}

		// 去mongodb 获取 工号对应的电话号码
		ObjectNode on = om.createObjectNode();
		ArrayNode failArray = om.createArrayNode();
		ObjectNode failOn = om.createObjectNode();
		int sum = 0;
		for (TaskTelsBean ttb : taskTelList) {
			try {
				int a = taskTelsService.addTaskTel(ttb);
				sum += a;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				failOn.put(ttb.getTask_id(), ttb.getName());
				failArray.addPOJO(failOn);
				continue;
			}

		}
		on.put("status", "1"); // 1 表示操作OK
		on.put("sum", sum);
		if (failArray.size() == 0) {
			on.put("fail", "空");
		} else
			on.putPOJO("fail", failArray);
		System.out.println(on.toString());
		return on;
		/*
		 * try { int sum = taskTelsService.addTaskTels(taskTelList); ObjectNode
		 * on = om.createObjectNode(); on.put("status", 1); // 1 表示操作OK
		 * on.put("sum", "update " + sum + " records"); return on; }
		 * catch(DuplicateKeyException e){ ObjectNode on =
		 * om.createObjectNode(); on.put("status", 2); // 1 表示操作OK on.put("sum",
		 * "0"); return on; }
		 */
	}

	// 修改每个任务的手机号
	@RequestMapping("/updatedailysms.do")
	@ResponseBody
	public ObjectNode modifySMS(HttpServletRequest request) {
		ObjectNode on = om.createObjectNode();
		String id = request.getParameter("id");// id
		String task_id = request.getParameter("task_id");// 任务名
		String names = request.getParameter("name"); // name 工号：电话
		String[] status = request.getParameterValues("status");// 状态
		String[] nametel = names.split(":");
		TaskTelsBean ttb = new TaskTelsBean();
		ttb.setId(Integer.valueOf(id));
		ttb.setName(nametel[0]);
		ttb.setTask_id(task_id);
		ttb.setTel(nametel[1]);
		ttb.setStatus(StringUtils.join(status, ","));
		taskTelsService.modifyTaskTels(ttb);
		on.put("status", 1);
		return on;
	}

	// 删除选择的任务对应的员工号和手机号
	@RequestMapping("deldailysms.do")
	@ResponseBody
	public ObjectNode delSMS(HttpServletRequest request) {
		ObjectNode on = om.createObjectNode();
		String ids = request.getParameter("ids");
		if (ids == null) {
			on.put("status", 0);
			on.put("msg", "没有获取选中记录！");
		} else {

			String[] idlist = ids.split(",");
			int[] num = new int[idlist.length];
			for (int i = 0; i < idlist.length; i++) {
				num[i] = Integer.parseInt(idlist[i]);
			}
			taskTelsService.deleteTaskTels(num);
			on.put("status", 1);
		}
		return on;
	}

	// 日终编辑的新建任务的获取task_id
	@RequestMapping("/getAllTaskID.do")
	@ResponseBody
	public JSONArray getAllTasks() {
		List<TaskParamBean> an = taskParamService.getAllTaskParams();
		JSONArray array = JSONArray.fromObject(an);
		return array;
	}

	// 从日终页面的添加模块的，下拉框获取 mongodb login 表的name tel 对应关系
	@RequestMapping("/getLoginInfo.do")
	@ResponseBody
	public ArrayNode getLoginInfo() {
		ArrayNode array = amsRestService.getList(null, null, "/api/v2/common?tableName=login");
		if (array == null) {
			return null;
		}
		ArrayNode outNode = om.createArrayNode();
		for (JsonNode item : array) {
			ObjectNode tempNode = om.createObjectNode();
			tempNode.put("name", item.get("name").asText());
			tempNode.put("nametel", item.get("name").asText() + ":" + item.get("tel").asText());
			outNode.addPOJO(tempNode);
		}
		return outNode;
	}

}
