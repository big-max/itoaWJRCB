package com.ibm.automation.installfixpack;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.core.bean.ServersBean;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.InstallFixpackUtil;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.ServerUtil;
import com.ibm.automation.remoteCommand.controller.remoteCommandController;

@Controller
public class InstallPluginController {
	@Autowired
	private ServerService service;
	@Autowired
	private AmsRestService amsRestService;
	private static Logger logger = Logger.getLogger(remoteCommandController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	ObjectMapper om = new ObjectMapper();
	
	@RequestMapping("/getAllIp.do")
	@ResponseBody
	public ArrayNode getAllIP(HttpServletRequest request, HttpSession session) {
		List<ServersBean> sb = null;
		ArrayNode allIp = om.createArrayNode();
		sb = ServerUtil.getList("odata/servers");
		for(int i = 0; i < sb.size(); i++){
			allIp.add(sb.get(i).getIp());
		}
		return allIp;
	}
	
	@RequestMapping("/viewInstallFixpackProcess.do")
	@ResponseBody
	public ObjectNode viewInstallFixpackProcess(HttpServletRequest request, HttpSession session) {
		ObjectNode installFixpackInfo = om.createObjectNode();
		InstallFixpackBean installFixpack = InstallFixpackUtil.getOne("");
		installFixpackInfo.put("fixpack_name", installFixpack.getFixpack_name());
		installFixpackInfo.put("fixpack_version", installFixpack.getFixpack_version());
		installFixpackInfo.put("job_log", installFixpack.getJob_log());
		installFixpackInfo.put("operator", installFixpack.getOperator());
		installFixpackInfo.put("run_status", installFixpack.getRun_status());
		installFixpackInfo.put("run_time", installFixpack.getRun_time());
		
		return installFixpackInfo;
	}
	
	@RequestMapping("/getAllInstallFixpackJob.do")
	public ArrayNode getAllInstallFixpackJob(HttpServletRequest request, HttpSession session) {
		ArrayNode installFixpackInfo = om.createArrayNode();
		List<InstallFixpackBean> installFixpack = InstallFixpackUtil.getList("");
		Collections.sort(installFixpack);
		for(int i = 0; i < installFixpack.size(); i++){
			installFixpackInfo.addPOJO(installFixpack.get(i));
		}
		return installFixpackInfo;
	}
	

}
