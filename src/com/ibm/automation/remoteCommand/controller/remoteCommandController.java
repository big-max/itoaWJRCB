package com.ibm.automation.remoteCommand.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.core.bean.ServersBean;
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.PropertiesAutoLoad;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.ServerUtil;
import com.ibm.automation.core.util.UtilDateTime;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import net.sf.json.JSONObject;

@Controller
public class remoteCommandController {
	@Autowired
	private ServerService service;
	@Autowired
	private AmsRestService amsRestService;
	private static Logger logger = Logger.getLogger(remoteCommandController.class);
	static Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	static ObjectMapper om = new ObjectMapper();
	static PropertiesAutoLoad prop = PropertiesAutoLoad.getInstance("config/properties/remoteCommand.properties");
	
	@RequestMapping("/remoteCommand.do")
	public String remoteCommand(HttpServletRequest request, HttpSession session) {
		List<ServersBean> lahb = null;
		lahb = ServerUtil.getList("odata/servers");
		Collections.sort(lahb);
		request.setAttribute("servers", lahb);
		request.setAttribute("total", lahb.size());
		getRemoteCommandLogs(request);
		return "instance_remote_command";
	}

	@RequestMapping("/toRemoteCommandNextPage.do")
	@ResponseBody
	public String toNextPage(HttpServletRequest request) {
		String step = request.getParameter("step");// 看是哪一步
		
		//String sessionId = request.getSession().getId(); // 获取哪个用户选的
		if (step.equalsIgnoreCase("selectMachine")) {
			String iplist = request.getParameter("iplist"); // 选了至少一台机器
			return iplist;
		} else if (step.equalsIgnoreCase("inputData")) { // 输入用户和执行的命令
			String user = request.getParameter("user");// 用户名
			String command = request.getParameter("command");// 用户命令
			String strOrgUrl = service.createSendUrl(PropertyKeyConst.AMS2_HOST,
					PropertyKeyConst.POST_ams2_remoteCommand);
			ArrayNode an = om.createArrayNode();
			String iplist = request.getParameter("iplist");//获取被选择的机器
			String[] ips = iplist.split(",");
			for (String ip : ips) {
				an.add(ip);
			}
			ObjectNode on = om.createObjectNode();
			on.putPOJO("targetIP", an);
			on.put("user", user);
			on.put("uuid", UUID.randomUUID().toString());
			on.put("command", command);
			String response = "";
			try {
				response = HttpClientUtil.postMethod(strOrgUrl, on.toString());
				
			} catch (NetWorkException | IOException e) {
				e.printStackTrace();
				logger.error("toRemoteCommand.do::" + e.getMessage());
			}
		}
		return "";
	}

	public String getRemoteCommandLogs(HttpServletRequest request) {
		ArrayNode lists = amsRestService.getList(null, null, "api/v1/remotecommand?type=getLogs");
		
		List<RemoteCommandBean> lrcb = new ArrayList<RemoteCommandBean>();
		for( JsonNode jn : lists)
		{
			RemoteCommandBean rcb = new RemoteCommandBean();
			rcb.setUuid(jn.get("uuid").asText());
			StringBuffer sb = new StringBuffer();
			for(JsonNode js : jn.get("targetIP"))
			{
				sb.append(js.asText()+ " ");
			}
			rcb.setTargetIP(sb.toString());
			rcb.setExeTime(UtilDateTime.getDateFromMilles(Double.valueOf(jn.get("exeTime").asText())));
			rcb.setCommand(jn.get("command").asText());
			rcb.setUser(jn.get("user").asText());
			rcb.setStatus(jn.get("status").asText());
			lrcb.add(rcb);
		}
		request.setAttribute("logs", lrcb);
		request.setAttribute("logsSize", lrcb.size());
		return "instance_remote_command";
	}
	
	@RequestMapping("/getRemoteCommandDetails.do")
	@ResponseBody
	public JsonNode getRemoteCommandDetails(HttpServletRequest request) {
		String uuid=request.getParameter("uuid");  //获取日志唯一标识符
		String base64uuid=Base64.encode(uuid.getBytes());
		JsonNode objNode = amsRestService.getList_one(null, null, "api/v1/remotecommand?type=getSingleLog&uuid="+base64uuid);
		
		return objNode;
	}
	
	//下载文件
	@RequestMapping("/remoteCommand_download_info.do")
	public void downloadRunInfo(HttpServletRequest request,HttpServletResponse response){
		String strOrgUrl = service.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_remoteCommand_logDownload);
		String uuid = request.getParameter("uuid");
		//String uuid ="206e7351-9b17-4370-af7d-0df65f74257d";
		ObjectNode sendJson = om.createObjectNode();
		sendJson.put("uuid", uuid);
		try {
			String retMsg = HttpClientUtil.postMethod(strOrgUrl, sendJson.toString());
			response.setContentType("application/ostet-stream");
			response.setHeader("Content-Disposition", "attachment;fileName=" + (uuid+".txt"));
			PrintWriter pw = response.getWriter();
			pw.write(retMsg);
			pw.flush();
			pw.close();

		} catch (NetWorkException | IOException e) {
			e.printStackTrace();
			logger.error("LogCatchController -- > 下载文件中，出现错误：" + e.getMessage());
		}
	}
	
	/*
	 * 添加禁止命令
	 */
	@RequestMapping("/nocommand.do")
	public String nocommand(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String commands = request.getParameter("commandString");
        try {
			prop.setProperty("forbidden", commands);
		} catch (ConfigurationException e) {
			e.printStackTrace();
		}
		
		JSONObject json = new JSONObject();
		json.put("msg", "success");
		return json.toString();		
	}
	
	/*
	 * 获取禁止命令
	 */
	@RequestMapping("/getCommands.do")
	@ResponseBody
	public JSONObject getCommands(HttpServletRequest request,HttpServletResponse response){		
		JSONObject on = new JSONObject();
		if(prop.getValueFromPropFile("forbidden") instanceof String){
			if(!prop.getValueFromPropFile("forbidden").equals("")){
				on.put(0, prop.getValueFromPropFile("forbidden"));
				System.out.println("forbidden is " + prop.getValueFromPropFile("forbidden"));
			}else {
				on =null;
			}
		}else if(prop.getValueFromPropFile("forbidden") instanceof List){
			ArrayList<String> com_array =  (ArrayList<String>) prop.getValueFromPropFile("forbidden");
			for(int i = 0; i < com_array.size(); i++){
				if(!com_array.get(i).equals("")){
					on.put(i, com_array.get(i));
				}
			}
		}
		return on;		
	}
}
