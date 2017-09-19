package com.ibm.automation.fixLoad.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.ServerUtil;
import com.ibm.automation.core.util.UtilDateTime;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import net.sf.json.JSONObject;

@Controller
public class fixLoadController {
	@Autowired
	private ServerService service;
	@Autowired
	private AmsRestService amsRestService;
	private static Logger logger = Logger.getLogger(fixLoadController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	ObjectMapper om = new ObjectMapper();

	@RequestMapping("/fixLoad.do")
	public String fixLoad(HttpServletRequest request, HttpSession session) {
		List<fixLoadBean> flb = ServerUtil.getPatchLoadingJobs("/api/v1/patchLoading");
		request.setAttribute("jobs", flb);
		return "instance_fix_load";
	}

	// 获取提交的任务
	@RequestMapping("/addFixLoadTask.do")
	@ResponseBody
	public ObjectNode addFixLoadTask(HttpServletRequest request) {
		ObjectNode objNode = om.createObjectNode();
		ArrayNode arrNode = om.createArrayNode();
		String exectime = UtilDateTime.getFormatCurrentDate();
		String fixlevel = request.getParameter("fixlevel");// 获取补丁级别
		String[] iplist = request.getParameterValues("iplist");// 获取IP
		for (int i = 0; i < iplist.length; i++) {
			arrNode.add(iplist[i]);
		}
		String userName = (String) request.getSession().getAttribute("userName");
		objNode.putPOJO("ip_list", arrNode);
		objNode.put("downloadpath", (String) amsprop.get("downloadpath"));
		objNode.put("ftp_user", (String) amsprop.getProperty("ftp_user"));
		objNode.put("ftp_password", (String) amsprop.getProperty("ftp_password"));
		objNode.put("ftp_server", (String) amsprop.getProperty("ftp_server"));
		objNode.put("softpath", (String) amsprop.getProperty("softpath"));
		objNode.put("fixpack_name", fixlevel);
		objNode.put("uuid", UUID.randomUUID().toString());
		objNode.put("exec_time", exectime);
		objNode.put("user", userName);// user如何生成
		objNode.put("status", 0);
		objNode.put("func", "add");
		String strOrgUrl = service.createSendUrl(PropertyKeyConst.AMS2_HOST, PropertyKeyConst.POST_ams2_patchLoading);
		String response = "";
		try {
			response = HttpClientUtil.postMethod(strOrgUrl, objNode.toString());
		} catch (NetWorkException | IOException e) {
			e.printStackTrace();
			logger.error("addFixLoadTask.do::" + e.getMessage());
		}
		ObjectNode on = om.createObjectNode();
		on.put("status", 1);
		on.put("msg", "success");
		return on;
	}

	@RequestMapping("/getfixloadfp.do")
	@ResponseBody
	public ArrayNode getfixloadfp(HttpServletRequest request, HttpServletResponse response) {

		ArrayNode arrNode = om.createArrayNode();
		ObjectNode on1 = om.createObjectNode();
		ObjectNode retNode = amsRestService.getList_one(null, null, "/api/v1/fp");
		String msg = retNode.get("msg").asText();

		JSONObject jsonObj = JSONObject.fromObject(msg);
		Iterator iter = jsonObj.keys();
		
		while (iter.hasNext()) {
			String str = (String) iter.next();
			String value=(String)jsonObj.get(str);
			ObjectNode innerNode = om.createObjectNode();
			innerNode.put(str, value);
			arrNode.addPOJO(innerNode);
		}
		return arrNode;
	}

	// 获取提交的任务
	@RequestMapping("/patchLoading_download_info.do")
	public void patchLoading_download_info(HttpServletRequest request, HttpServletResponse response) {
		String strOrgUrl = service.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_patchLoading_logDownload);
		String uuid = request.getParameter("uuid");
		ObjectNode sendJson = om.createObjectNode();
		sendJson.put("uuid", uuid);
		try {
			String retMsg = HttpClientUtil.postMethod(strOrgUrl, sendJson.toString());
			response.setContentType("application/ostet-stream");
			response.setHeader("Content-Disposition", "attachment;fileName=" + (uuid + ".txt"));
			PrintWriter pw = response.getWriter();
			pw.write(retMsg);
			pw.flush();
			pw.close();

		} catch (NetWorkException | IOException e) {
			e.printStackTrace();
			logger.error("LogCatchController -- > 下载文件中，出现错误：" + e.getMessage());
		}
	}
	
	@RequestMapping("/getPatchLoadingCommandDetails.do")
	@ResponseBody
	public JsonNode getPatchLoadingCommandDetails(HttpServletRequest request, HttpServletResponse response){
		String uuid=request.getParameter("uuid");  //获取日志唯一标识符
		String base64uuid=Base64.encode(uuid.getBytes());
		JsonNode objNode = amsRestService.getList_one(null, null, "api/v1/patchLoading?type=getSingleLog&uuid="+base64uuid);
		System.out.println(objNode);
		return objNode;
	}
}
