package com.ibm.automation.core.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.ams.service.impl.AmsRestServiceImpl;
import com.ibm.automation.core.bean.ServersBean;
import com.ibm.automation.securityEnforce.SecurityEnforceBean;
import com.ibm.automation.securityEnforce.SecurityEnforceSummaryBean;
import com.ibm.automation.securityEnforce.SecurityJobSummaryBean;

public class SecurityEnforceUtil {
	public static AmsRestService amsRestService = new AmsRestServiceImpl();
	private static Logger logger = Logger.getLogger(ServerUtil.class);
	static ObjectMapper om = new ObjectMapper();
	
	//获取所有安全加固和安全检测任务信息
	public static List<SecurityJobSummaryBean> getAllSecurityJobSummary(String path){
		try{
			List<SecurityJobSummaryBean> allJobs = new ArrayList<SecurityJobSummaryBean>();
			ArrayNode result = amsRestService.getList(null,null,path);
			
			for(JsonNode jn : result){
				SecurityJobSummaryBean sjsb = new SecurityJobSummaryBean();
				sjsb.setStatus(jn.get("status") == null ? null : jn.get("status").asInt());
				sjsb.setSecurity_template(jn.get("security_template") == null ? "" : jn.get("security_template").asText());
				sjsb.setUuid(jn.get("uuid") == null ? "" : jn.get("uuid").asText());
				sjsb.setExectime(jn.get("exectime") == null ? "" : jn.get("exectime").asText());
				sjsb.setJob_type(jn.get("job_type") == null ? null : jn.get("job_type").asInt());
				sjsb.setUser(jn.get("user") == null ? "" : jn.get("user").asText());
				sjsb.setFunc(jn.get("func") == null ? "" : jn.get("func").asText());
				List<String> templist = new ArrayList<String>();
				for( JsonNode jsip : jn.get("ip_list")){
					templist.add(jsip.asText());
				}
				sjsb.setIp_list(templist);
				sjsb.setSummary(jn.get("summary") == null ? "" : jn.get("summary").asText());
				allJobs.add(sjsb);
			}
			return allJobs;
		}catch(Exception e){
			logger.info("get alljobs error from SecurityEnforceUtil");
			e.printStackTrace();
		}		
		return null;
	}
	
	public static List<String> getAllIP(String path){
		try{
			List<String> ips = new ArrayList<String>();
			ArrayNode result = amsRestService.getList(null,null,path);
			for ( JsonNode jn : result)
			{
				String temp = "";
				temp = jn.get("ip") == null ? "" : jn.get("ip").asText();
				ips.add(temp);
			}
			return ips;
		}catch(Exception e){
			logger.info("get IPS error!");
		}
		return null;
	}
	//获取所有安全加固模板信息
	public static List<SecurityEnforceBean> getAllSecurityEnforceTemplate(String path){
		try{
			List<SecurityEnforceBean> sebList = new ArrayList<SecurityEnforceBean>();
			ObjectNode result = amsRestService.getList_one(null,null,path);
			if(result.get("status").asInt()==0){
				logger.error("从tornado获取所有安全加固模板时不成功！");
			}else if(result.get("status").asInt()==1){
				ArrayNode securityEnforceTemplate = (ArrayNode) result.get("msg");
				for ( JsonNode jn : securityEnforceTemplate)
				{
					SecurityEnforceBean jb = new SecurityEnforceBean();
					jb.setUuid(jn.get("uuid") == null ? "" : jn.get("uuid").asText());
					jb.setCreate_time(jn.get("create_time") == null ? "" : jn.get("create_time").asText());
					jb.setDetail(jn.get("detail") == null ? "" : jn.get("detail").asText());
					jb.setUser(jn.get("user") == null ? "" : jn.get("user").asText());
					jb.setTemplate_name(jn.get("template") == null ? "" : jn.get("template").asText());
					
					jb.setParam_opt_value(jn.get("template_params").get("opt").get("value") == null ? "" : jn.get("template_params").get("opt").get("value").asText());
					jb.setParam_opt_result(jn.get("template_params").get("opt").get("result") == null ? null : jn.get("template_params").get("opt").get("result").asInt());
					
					jb.setParam_toptea_value(jn.get("template_params").get("toptea").get("value") == null ? "" : jn.get("template_params").get("toptea").get("value").asText());
					jb.setParam_toptea_result(jn.get("template_params").get("toptea").get("result") == null ? null : jn.get("template_params").get("toptea").get("result").asInt());
					
					jb.setParam_anoftp_value(jn.get("template_params").get("anoftp").get("value") == null ? "" : jn.get("template_params").get("anoftp").get("value").asText());
					jb.setParam_anoftp_result(jn.get("template_params").get("anoftp").get("result") == null ? null : jn.get("template_params").get("anoftp").get("result").asInt());
					
					jb.setParam_timeout_value(jn.get("template_params").get("timeout").get("value") == null ? "" : jn.get("template_params").get("timeout").get("value").asText());
					jb.setParam_timeout_result(jn.get("template_params").get("timeout").get("result") == null ? null : jn.get("template_params").get("timeout").get("result").asInt());
					sebList.add(jb);
				}
				return sebList;
			}
		}catch(NullPointerException e )
		{
			//System.out.println("获取jobs发生空指针异常，/api/v1/securityenforceTemplate::" + e.getMessage());
			logger.info("获取jobs发生空指针异常，/api/v1/securityenforceTemplate::" + e.getMessage());
		}
		return null;
	}

	public static List<SecurityEnforceSummaryBean> getOneSecurityJob(String path) {
		try{
			List<SecurityEnforceSummaryBean> sjsblist = new ArrayList<SecurityEnforceSummaryBean>();
			ObjectNode jn = amsRestService.getList_one(null,null,path);
			ArrayNode an1 = (ArrayNode) jn.get("arr");
			ObjectNode on = (ObjectNode) jn.get("obj");
			for(JsonNode on1 : an1){
				SecurityEnforceSummaryBean sjsb = new SecurityEnforceSummaryBean();
				sjsb.setip(on1.get("ip").asText());
				sjsb.setrun_uuid(on1.get("run_uuid").asText());
				sjsb.setstatus(on1.get("status").asInt());
				sjsb.setsummary(on1.get("summary").asText());
				sjsb.setuuid(on1.get("uuid").asText());
				JsonNode jnstd = om.readTree(on1.get("stdout").asText());
				sjsb.setstdout_status(jnstd.get("status").asInt());
				sjsb.setstdout_detail_opt_result(jnstd.get("detail").get("opt").get("result").asInt());
				sjsb.setstdout_detail_opt_value(jnstd.get("detail").get("opt").get("value").asText());
				sjsb.setstdout_detail_umask_result(jnstd.get("detail").get("umask").get("result").asInt());
				sjsb.setstdout_detail_umask_value(jnstd.get("detail").get("umask").get("value").asText());
				sjsb.setstdout_detail_nofile_value(jnstd.get("detail").get("nofile").get("value").asText());
				sjsb.setstdout_detail_nofile_result(jnstd.get("detail").get("nofile").get("result").asInt());
				sjsb.setstdout_detail_ano_ftp_value(jnstd.get("detail").get("ano_ftp").get("value").asText());
				sjsb.setstdout_detail_ano_ftp_result(jnstd.get("detail").get("ano_ftp").get("result").asInt());
				sjsb.setstdout_detail_timeout_result(jnstd.get("detail").get("timeout").get("result").asInt());
				sjsb.setstdout_detail_timeout_value(jnstd.get("detail").get("timeout").get("value").asText());
				sjsb.setstdout_detail_toptea_value(jnstd.get("detail").get("toptea").get("value").asText());
				sjsb.setstdout_detail_toptea_result(jnstd.get("detail").get("toptea").get("result").asInt());
				sjsblist.add(sjsb);
			}
			on.get("status").asInt();
			on.get("security_template").asText();
			on.get("uuid").asText();
			on.get("exectime").asText();
			on.get("job_type").asInt();
			on.get("user").asText();
			on.get("func").asText();
			List<String> temp_ip = new ArrayList<String>();
			for( JsonNode jn1 : on.get("ip_list")){
				temp_ip.add(jn1.asText());
			}	
			return sjsblist;
		}catch(Exception e){
			logger.info("get one jobs error from SecurityEnforceUtil");
		}
		return null;
	}

	public static SecurityEnforceSummaryBean getSecuritySummaryInfo(String path) {
		try{
			ObjectNode jn = amsRestService.getList_one(null,null,path);

			SecurityEnforceSummaryBean sjsb = new SecurityEnforceSummaryBean();
			sjsb.setip(jn.get("ip").asText());
			sjsb.setrun_uuid(jn.get("run_uuid").asText());
			sjsb.setstatus(jn.get("status").asInt());
			sjsb.setsummary(jn.get("summary").asText());
			sjsb.setuuid(jn.get("uuid").asText());
			JsonNode jnstd = om.readTree(jn.get("stdout").asText());
			sjsb.setstdout_status(jnstd.get("status").asInt());
			sjsb.setstdout_detail_opt_result(jnstd.get("detail").get("opt").get("result").asInt());
			sjsb.setstdout_detail_opt_value(jnstd.get("detail").get("opt").get("value").asText());
			sjsb.setstdout_detail_umask_result(jnstd.get("detail").get("umask").get("result").asInt());
			sjsb.setstdout_detail_umask_value(jnstd.get("detail").get("umask").get("value").asText());
			sjsb.setstdout_detail_nofile_value(jnstd.get("detail").get("nofile").get("value").asText());
			sjsb.setstdout_detail_nofile_result(jnstd.get("detail").get("nofile").get("result").asInt());
			sjsb.setstdout_detail_ano_ftp_value(jnstd.get("detail").get("ano_ftp").get("value").asText());
			sjsb.setstdout_detail_ano_ftp_result(jnstd.get("detail").get("ano_ftp").get("result").asInt());
			sjsb.setstdout_detail_timeout_result(jnstd.get("detail").get("timeout").get("result").asInt());
			sjsb.setstdout_detail_timeout_value(jnstd.get("detail").get("timeout").get("value").asText());
			sjsb.setstdout_detail_toptea_value(jnstd.get("detail").get("toptea").get("value").asText());
			sjsb.setstdout_detail_toptea_result(jnstd.get("detail").get("toptea").get("result").asInt());
			
			
			return sjsb;
		}catch(Exception e){
			logger.info("get one jobs error from SecurityEnforceUtil");
		}
		return null;
	}
}
