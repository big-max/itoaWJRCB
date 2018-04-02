package com.ibm.automation.tsmrecover;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.core.bean.ServersBean;
import com.ibm.automation.core.dao.BackupServerMapper;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.ServerUtil;
import com.ibm.automation.domain.BackupServer;

import net.sf.json.JSONObject;

@Controller
public class TsmRecoverController {
	@Autowired
	private BackupServerMapper bsm;
	@Autowired
	private ServerService service;
	@Autowired
	private AmsRestService amsRestService;
	private static Logger logger = Logger.getLogger(TsmRecoverController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	ObjectMapper om = new ObjectMapper();
	
	@RequestMapping("/recover.do")
	public String recover(HttpServletRequest request, HttpSession session) {
		return "/tsmrecover/instance_tsmrecover_main";
	}
	
	@RequestMapping("/BackRecover.do")
	public String backRecover(HttpServletRequest request, HttpSession session) {
		return "/tsmrecover/instance_tsmrecover_backresource";
	}
	
	@RequestMapping("/toTargetEnv.do")
	public String toTargetEnv(HttpServletRequest request, HttpSession session) {
		return "/tsmrecover/instance_tsmrecover_choicetarget";
	}
	
	@RequestMapping("/toConfirmTask.do")
	public String toConfirmTask(HttpServletRequest request, HttpSession session) {
		return "/tsmrecover/instance_tsmrecover_confirmtask";
	}
	
	@RequestMapping("/recoverlog.do")
	public String recoverlog(HttpServletRequest request, HttpSession session) {
		return "/tsmrecover/instance_tsmrecover_log";
	}
	
	@RequestMapping("/toDetailsLogPage.do")
	public String toDetailsLogPage(HttpServletRequest request, HttpSession session) {
		return "/tsmrecover/instance_tsmrecover_log";
	}
	
	@RequestMapping("/tsmDetailLog.do")
	public String tsmDetailLog(HttpServletRequest request, HttpSession session) {
		return "/tsmrecover/instance_tsmrecover_log_details";
	}
	
	@RequestMapping("/addBackupServer.do")
	@ResponseBody
	public String addBackupServer(HttpServletRequest request, HttpSession session) {
		String serverType = request.getParameter("addServer_type");
		String serverIP = request.getParameter("addServer_ip");
		String serverVersion = request.getParameter("addServer_version");
		
		BackupServer bs = new BackupServer(serverType, serverIP, serverVersion);
		
		int insertRecord = bsm.insertSelective(bs);
		JSONObject json = new JSONObject();
		
		if(1 == insertRecord){
			json.put("msg", 1);
		}else{
			json.put("msg", 2);
		}
		return json.toString();
	}
  
	@RequestMapping("/showBackupServer.do")
	@ResponseBody
	public String showBackupServer(HttpServletRequest request, HttpSession session) {
		
		ObjectMapper mapper= new ObjectMapper();
		List<BackupServer> serverList = bsm.selectAll();
		try {
			String jsonStr = mapper.writeValueAsString(serverList);
			JSONObject json = new JSONObject();
			json.put("total", serverList.size());
			json.put("rows", jsonStr);
			return json.toString();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			JSONObject json = new JSONObject();
			json.put("msg", "error");
			return json.toString();
		}
	}
	
	@RequestMapping("/delBackupServer.do")
	@ResponseBody
	public String delBackupServer(HttpServletRequest request) {
		String[] idr = request.getParameterValues("ids[]");
		JSONObject json = new JSONObject();
		if(!idr.equals(null)){
			int notdel = 0;
			for(String id : idr){
				if(id != ""){
					int dels = bsm.deleteByPrimaryKey(Integer.parseInt(id));
					if(dels != 1){
						notdel++;
					}
				}
			}
			json.put("msg", "success");
			json.put("delRecords", (idr.length-notdel));
			json.put("notdel",notdel);
			System.out.println(json.toString());
		}else {
			json.put("msg", "failed");
		}
		return json.toString();
	}
}
