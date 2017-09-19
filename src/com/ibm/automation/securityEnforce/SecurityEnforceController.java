package com.ibm.automation.securityEnforce;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.PropertiesAutoLoad;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.SecurityEnforceUtil;
import com.ibm.automation.core.util.UtilDateTime;
import com.ibm.automation.remoteCommand.controller.remoteCommandController;

import net.sf.json.JSONObject;

@Controller
public class SecurityEnforceController {
	@Autowired
	private ServerService service;
	@Autowired
	private AmsRestService amsRestService;
	private static Logger logger = Logger.getLogger(remoteCommandController.class);
	static Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	static ObjectMapper om = new ObjectMapper();
	static PropertiesAutoLoad prop = PropertiesAutoLoad.getInstance("config/properties/securityTemp.properties");
	
	//为安全模板添加一个指标
	@RequestMapping("/addItem.do")
	@ResponseBody
	public String addItem(HttpServletRequest request, HttpSession session){
		String key = request.getParameter("key");
		String param = request.getParameter("newkey");
		String param_value = request.getParameter("newvalue");
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		String time1 = time.replace(":", "|");
		String data = "create_time:" + time1 + ","
				+ "detail:this is detail for securityenforce template,"
				+ "template_name:Template1,"
				+ "user:root,"
				+ "uuid:123456,"
				+ param + ":" + param_value;
		try {
			prop.setProperty(key, data);
		} catch (ConfigurationException e) {
			e.printStackTrace();
		}
		
		JSONObject json = new JSONObject();
		json.put("msg", "success");
		return json.toString();		
	}
	
	//获取安全模板添加的所有指标
	@RequestMapping("/getItem.do")
	@ResponseBody
	public List<JSONObject> getItem(HttpServletRequest request, HttpSession session){
		String key = null;
		if ( request.getParameter("key") != null ) {
			key = request.getParameter("key");
		}
		List<JSONObject> on = new ArrayList<JSONObject>();
		if ( key != null ) {
			if(prop.getValueFromPropFile(key) instanceof String){
				if(!prop.getValueFromPropFile(key).equals("")){
					String[] data = ((String) prop.getValueFromPropFile(key)).split(":");
					JSONObject json = new JSONObject();
					json.put(data[0], data[1]);
					on.add(json);
				}else {
					on = null;
				}
			}else if(prop.getValueFromPropFile(key) instanceof List){
				ArrayList<String> com_array =  (ArrayList<String>) prop.getValueFromPropFile(key);
				JSONObject json = new JSONObject();
				for(int j = 0; j < com_array.size(); j++){
					if(!com_array.get(j).equals("")){
						String[] data = com_array.get(j).split(":");
						json.put(data[0], data[1]);
					}
				}
				on.add(json);
			}
		}
		else {
			List<String> keys = prop.getKeys();
			for(int i = 0; i < keys.size(); i++){
				if(prop.getValueFromPropFile(keys.get(i)) instanceof String){
					if(!prop.getValueFromPropFile(keys.get(i)).equals("")){
						String[] data = ((String) prop.getValueFromPropFile(keys.get(i))).split(":");
						JSONObject json = new JSONObject();
						json.put(data[0], data[1]);
						on.add(json);
					}else {
						on = null;
					}
				}else if(prop.getValueFromPropFile(keys.get(i)) instanceof List){
					ArrayList<String> com_array =  (ArrayList<String>) prop.getValueFromPropFile(keys.get(i));
					JSONObject json = new JSONObject();
					for(int j = 0; j < com_array.size(); j++){
						if(!com_array.get(j).equals("")){
							String[] data = com_array.get(j).split(":");
							json.put(data[0], data[1]);
						}
					}
					on.add(json);
				}
			}
		}
		return on;	
	}
	
	//获取所有安全模板信息
	@RequestMapping("/getAllsecurityTemplate.do")
	public String getAllsecurityTemplate(HttpServletRequest request, HttpSession session) {
		List<SecurityEnforceBean> seb = new ArrayList<SecurityEnforceBean>();
		List<JSONObject> obj = getItem(request,session);
		for ( JSONObject json: obj ) {
			SecurityEnforceBean temp = new SecurityEnforceBean();
			String create_time=(String)json.get("create_time");
			create_time = create_time.replace("|", ":");
			
			temp.setCreate_time(create_time);
			temp.setDetail((String) json.get("datail"));
			temp.setTemplate_name((String) json.get("template_name"));
			temp.setUser((String) json.get("user"));
			temp.setUuid((String) json.get("uuid"));
			seb.add(temp);
		}
		
		System.out.println(obj);
		
		Collections.sort(seb);
		request.setAttribute("securitytemplate", seb);
		request.setAttribute("total", seb.size());
		return "instance_security_modle";
	}
	
	//获取所有安全加固和安全检查相关任务
	@RequestMapping("/getAllsecurityJobs.do")
	public String getAllsecurityJobs(HttpServletRequest request, HttpSession session) {
		List<SecurityJobSummaryBean> seb = new ArrayList<SecurityJobSummaryBean>();
		seb = SecurityEnforceUtil.getAllSecurityJobSummary("api/v1/securityenforce?jobs=all");
		
		Collections.sort(seb);
		request.setAttribute("securityJobs", seb);
		request.setAttribute("total", seb.size());
		return "instance_securityenforce"; 
	}
	
	//针对某个IP获取安全加固或者安全检查任务详情
	@RequestMapping("/instance_security_enforce_summary.do")
	public String getSinglesecurityJobs(HttpServletRequest request, HttpSession session) {
		SecurityEnforceSummaryBean sjs = new SecurityEnforceSummaryBean();
		
		String run_uuid = request.getParameter("run_uuid");
		/*String security_temp = request.getParameter("security_template");
		sjs = SecurityEnforceUtil.getSecuritySummaryInfo("api/v1/securityenforce?page=summary&run_uuid="+run_uuid+"&jobs=2");
		*/
		String uuid = (String) request.getSession().getAttribute("uuid");
		List<SecurityEnforceSummaryBean> sjslist = new ArrayList<SecurityEnforceSummaryBean>();
		sjslist = SecurityEnforceUtil.getOneSecurityJob("api/v1/securityenforce?page=outline&uuid="+uuid+"&jobs=1");
		System.out.println(sjslist.get(0).getrun_uuid());

		for(int i=0; i<sjslist.size(); i++){
			if(sjslist.get(i).getrun_uuid().equals(run_uuid)){
				System.out.println(sjslist.get(i).getstdout_detail_ano_ftp_value());
				sjs.setip(sjslist.get(i).getip());
				sjs.setrun_uuid(sjslist.get(i).getrun_uuid());
				sjs.setstatus(sjslist.get(i).getstatus());
				sjs.setstdout_detail_ano_ftp_result(sjslist.get(i).getstdout_detail_ano_ftp_result());
				sjs.setstdout_detail_ano_ftp_value(sjslist.get(i).getstdout_detail_ano_ftp_value());
				sjs.setstdout_detail_nofile_result(sjslist.get(i).getstdout_detail_nofile_result());
				sjs.setstdout_detail_nofile_value(sjslist.get(i).getstdout_detail_nofile_value());
				sjs.setstdout_detail_umask_result(sjslist.get(i).getstdout_detail_umask_result());
				sjs.setstdout_detail_umask_value(sjslist.get(i).getstdout_detail_umask_value());
				sjs.setstdout_detail_timeout_result(sjslist.get(i).getstdout_detail_timeout_result());
				sjs.setstdout_detail_timeout_value(sjslist.get(i).getstdout_detail_timeout_value());
				sjs.setstdout_detail_toptea_result(sjslist.get(i).getstdout_detail_toptea_result());
				sjs.setstdout_detail_toptea_value(sjslist.get(i).getstdout_detail_toptea_value());
				sjs.setstdout_detail_opt_result(sjslist.get(i).getstdout_detail_opt_result());
				sjs.setstdout_detail_opt_value(sjslist.get(i).getstdout_detail_opt_value());
				
			}
		}
		request.setAttribute("securitytemplate", sjs);
		return "instance_securityenforce_summary";  //要改要改要改要改要改要改要改要改要改要改
	}
	
	//获取某个安全任务信息
	@RequestMapping("/instance_securityenforce_outline.do")
	public String getOnesecurityJob(HttpServletRequest request, HttpSession session) {
		String uuid = request.getParameter("uuid");
		List<SecurityEnforceSummaryBean> sjslist = new ArrayList<SecurityEnforceSummaryBean>();
		SecurityEnforceOutlineBean seob = new SecurityEnforceOutlineBean();
		int correctnum = 0;
		int totalnum = 0;
		int incorrectnum = 0;
		try{
			ObjectNode on = amsRestService.getList_one(null,null,"api/v1/securityenforce?page=outline&uuid="+uuid+"&jobs=1");
			ArrayNode arr = (ArrayNode) on.get("arr");
			ObjectNode obj = (ObjectNode) on.get("obj");
			for(JsonNode on1 : arr){
				
				totalnum++;
				if(on1.get("status").asInt() == 0){
					incorrectnum++;
				}else if(on1.get("status").asInt() == 1){
					correctnum++;
				}
				
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
				sjslist.add(sjsb);
			}
			seob.setstatus(obj.get("status").asInt());
			seob.setsecurity_template(obj.get("security_template").asText());
			seob.setuuid(obj.get("uuid").asText());
			seob.setexectime(obj.get("exectime").asText());
			seob.setjob_type(obj.get("job_type").asInt());
			seob.setuser(obj.get("user").asText());
			seob.setfunc(obj.get("func").asText());
			List<String> temp_ip = new ArrayList<String>();
			for( JsonNode jn1 : obj.get("ip_list")){
				temp_ip.add(jn1.asText());
			}	
			seob.setip_list(temp_ip);
			seob.setCorrectnum(correctnum);
			seob.setIncorrectnum(incorrectnum);
			seob.setTotalnum(totalnum);
		}catch(NullPointerException | IOException e){
			logger.error("获取outline页面所需数据出错了，错误信息如下：" + e);
		}
		
		
		request.getSession().setAttribute("uuid", uuid);
		request.setAttribute("securityIPJobList", sjslist);
		request.setAttribute("securitySummaryInfo", seob);
		return "instance_securityenforce_outline"; //要改要改要改要改要改要改要改要改要改要改
	}
	
	//发起一个任务
	@RequestMapping("/addSecurityJob.do")
	@ResponseBody
	public Boolean addSecurityEnforceTemplate(HttpServletRequest request) {
		String uuid = UUID.randomUUID().toString();
		String ip_list_get = request.getParameter("ip_list");
		String[] ip_list = ip_list_get.split(",");
		String exectime = UtilDateTime.getFormatCurrentDate();
		int status = 0;
		String user = (String) request.getSession().getAttribute("userName");
		String security_template = request.getParameter("security_template");
		int job_type = Integer.parseInt(request.getParameter("job_type"));

		String func = "add";
		
		ArrayNode an = om.createArrayNode();
		for( String ip : ip_list){
			an.add(ip);
		}
		
		ObjectNode on = om.createObjectNode();
		on.put("uuid", uuid);
		on.putPOJO("ip_list", an);
		on.put("exectime", exectime);
		on.put("func", func);
		on.put("status", status);
		on.put("user", user);
		on.put("security_template", security_template);
		on.put("job_type", job_type);
		
		String strOrgUrl = service.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_securityEnforce);
		String response = "";
		try {
			response = HttpClientUtil.postMethod(strOrgUrl, on.toString());
			System.out.println(response);
		} catch (NetWorkException | IOException e) {
			e.printStackTrace();
			logger.error("addSecurityJob.do::" + e.getMessage());
		}	
		return true;
	}
	public static void main(String[] args) {
		String s="2017-07-02 12|12|12";
		String s1 = s.replace("|", ":");
		System.out.println(s1);
	}
}
