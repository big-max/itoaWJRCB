package com.ibm.automation.core.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.ams.service.impl.AmsRestServiceImpl;
import com.ibm.automation.installfixpack.InstallFixpackBean;

public class InstallFixpackUtil {
	public static AmsRestService amsRestService = new AmsRestServiceImpl();
	private static Logger logger = Logger.getLogger(ServerUtil.class);
	
	//获取加载补丁任务详情
	public static InstallFixpackBean getOne(String path){
		InstallFixpackBean temp = new InstallFixpackBean();
		try {
			ObjectNode js = amsRestService.getList_one(null, null, path);
			temp.setOperator(js.get("operator")!=null ? js.get("operator").asText():"");
			temp.setJob_log(js.get("job_log")!=null ? js.get("job_log").asText() : "");
			temp.setFixpack_name(js.get("fixpack_name")!=null ? js.get("fixpack_name").asText() : "");
			temp.setFixpack_version(js.get("fixpack_version")!=null ? js.get("fixpack_version").asText() : "");
			temp.setRun_status(js.get("run_status")!=null ? js.get("run_status").asText():"");
			temp.setTarget_ips(js.get("target_ips")!=null ? js.get("target_ips").asText():"");
			temp.setUuid(js.get("uuid")!=null ? js.get("uuid").asText():"");
			
		} catch (NullPointerException e) {
			logger.info("发生空指针异常，odata/servers::" + e.getMessage());
		}
		return temp;
	}
	
	//获取加载补丁任务详情
	public static List<InstallFixpackBean> getList(String path){
		List<InstallFixpackBean> ifb = new ArrayList<InstallFixpackBean>();
		try {
			ArrayNode an  = amsRestService.getList(null, null, path);
			for ( JsonNode js : an){
				InstallFixpackBean temp = new InstallFixpackBean();
				temp.setOperator(js.get("operator")!=null ? js.get("operator").asText():"");
				temp.setJob_log(js.get("job_log")!=null ? js.get("job_log").asText() : "");
				temp.setFixpack_name(js.get("fixpack_name")!=null ? js.get("fixpack_name").asText() : "");
				temp.setFixpack_version(js.get("fixpack_version")!=null ? js.get("fixpack_version").asText() : "");
				temp.setRun_status(js.get("run_status")!=null ? js.get("run_status").asText():"");
				temp.setTarget_ips(js.get("target_ips")!=null ? js.get("target_ips").asText():"");
				temp.setUuid(js.get("uuid")!=null ? js.get("uuid").asText():"");
				ifb.add(temp);
			}
			
		} catch (NullPointerException e) {
			logger.info("发生空指针异常，odata/servers::" + e.getMessage());
		}
		Collections.sort(ifb);
		return ifb;
	}

}
