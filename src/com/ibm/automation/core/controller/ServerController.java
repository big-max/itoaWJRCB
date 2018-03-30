package com.ibm.automation.core.controller;

import java.util.Collections;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.core.bean.ServersBean;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.ExcelUtils;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.ServerUtil;

import net.sf.json.JSONObject;

@Controller
public class ServerController {
	Properties amsCfg = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	private static Logger logger = Logger.getLogger(ServerController.class);
	ObjectMapper om = new ObjectMapper();
	@Autowired
	private ServerService addhostserivce;
	@Autowired
	private AmsRestService amsRestService;

	public ServerController() {
	}

	/**
	 * 根据uuid列表删除主机
	 */
	@RequestMapping("delServer.do")
	@ResponseBody
	public String deleteServer(HttpServletRequest request) {
		ArrayNode an = om.createArrayNode();
		ObjectNode out = om.createObjectNode();

		String infoId = request.getParameter("data1");
		String ip = request.getParameter("ip");
		String[] uuids = infoId.split(",");
		String[] ips = ip.split(",");
		if (uuids.length == 1) {
			ObjectNode inner = om.createObjectNode();
			inner.put("uuid", uuids[0]);
			inner.put("ip", ips[0]);
			an.add(inner);
		} else {
			for (int i = 0; i < uuids.length; i++) {
				ObjectNode inner = om.createObjectNode();
				inner.put("uuid", uuids[i]);
				inner.put("ip", ips[i]);
				an.add(inner);
			}
		}
		out.put("type", "deleteServer");
		out.putPOJO("servers", an);
		int ret = addhostserivce.deleteServer(out.toString());
		JSONObject json = new JSONObject();
		if (ret == 1)
			json.put("msg", 1);
		else
			json.put("msg", 0);

		return json.toString();// 已经存在ip
	}

	/**
	 * 获取主机列表
	 * 
	 */
	@RequestMapping("/getAllServers.do")
	public String getAllServers(HttpServletRequest request, HttpServletResponse resp, HttpSession session) {
		List<ServersBean> lahb = ServerUtil.getList("odata/servers");

		Collections.sort(lahb);
		request.setAttribute("servers", lahb);
		request.setAttribute("total", lahb.size());

		return "instance_main_list";
	}

	@RequestMapping("/refreshservers.do")
	@ResponseBody
	public ArrayNode refreshServers(HttpServletRequest request, HttpServletResponse resp, HttpSession session)
			throws JsonProcessingException {
		List<ServersBean> lahb = ServerUtil.getList("odata/servers");
		Collections.sort(lahb);
		ArrayNode an = om.createArrayNode();
		for (ServersBean sb : lahb) {
			ObjectNode on = om.createObjectNode();
			on.put("uuid", sb.getUuid());
			on.put("name", sb.getName());
			on.put("ip", sb.getIp());
			on.put("hconf", sb.getHconf());
			on.put("os", sb.getOs());
			on.put("status", sb.getStatus());
			an.add(on);
		}
		return an;
	}

	// 得到所有主机列表的ip
	@RequestMapping("/getAllips.do")
	@ResponseBody
	public ArrayNode getAllips(HttpServletRequest request, HttpServletResponse resp, HttpSession session) {
		List<ServersBean> lahb = ServerUtil.getList("odata/servers");
		ArrayNode an = om.createArrayNode();// ["1","2"]{}
		Collections.sort(lahb);
		for (ServersBean sb : lahb) {
			String ip = sb.getIp();
			an.add(ip);
		}
		return an;
	}

	/**
	 * responsebody 表示要返回字符串，不返回页面
	 */
	@RequestMapping("/IPCheck.do")
	@ResponseBody
	public String ipcheck(HttpServletRequest request, HttpSession session) {
		String ip = request.getParameter("IP");
		int status = addhostserivce.IPCheck(ip, "IPCheck");
		if (status == 1) {
			JSONObject json = new JSONObject();
			json.put("msg", 1);
			return json.toString();// 已经存在ip
		} else {
			JSONObject json = new JSONObject();
			json.put("msg", 0);
			return json.toString();// 不存在IP
		}
	}

	/**
	 * 根据Excel批量导入主机信息
	 * 
	 */
	@RequestMapping(value = "/importExcel.do", method = RequestMethod.POST)
	@ResponseBody
	public String importExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		ObjectMapper om = new ObjectMapper();
		ArrayNode objArray = om.createArrayNode();
		ObjectNode totalObj = om.createObjectNode();// 总的节点
		ExcelUtils ex = new ExcelUtils();
		try {
			List<Object[]> list = ex.importExcel(file.getName(), file.getInputStream());
			for (Object[] ss : list) {
				ObjectNode inner = om.createObjectNode();
				inner.put("name", "DefaultName");
				inner.put("ip", (String) ss[0]);
				inner.put("userid", (String) ss[1]);
				inner.put("password", (String) ss[2]);
				inner.put("uuid", UUID.randomUUID().toString());
				inner.put("status", "Error");
				inner.put("os", "DefaultOS");
				inner.put("product", (String) ss[3]);
				inner.put("hvisor", "DefaultHVisor");
				inner.put("hconf", "DefaultHConf");
				objArray.add(inner);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		totalObj.put("type", "importExcel");
		totalObj.putPOJO("servers", objArray);
		JSONObject obj = addhostserivce.importFromExcel(totalObj.toString());
		if (obj != null) {
			if (obj.getInt("status") == 1 ) {
				JSONObject json = new JSONObject();
				json.put("msg", "success");
				json.put("detail", obj.get("message").toString());
				request.setAttribute("status", "success");
				return json.toString();// 成功
			} else {
				request.setAttribute("status", "failure");
				JSONObject json = new JSONObject();
				json.put("msg", "failure");
				return json.toString();//
			}
		}
		return null;
	}

	// 封装多选的product 属性 [mq was db2 itm] to mq,was,db2,itm
	public String encodeProduct(HttpServletRequest request) {
		String[] pro = request.getParameterValues("product");
		return String.join(",", pro).toString();
	}

	/**
	 * 1成功,2 已经存在server，无法添加 0 未存在server，已经帮你添加到mongodb
	 */
	@RequestMapping("/addHost.do")
	@ResponseBody
	public String addHost(HttpServletRequest request, HttpSession session) {
		ServersBean ahb = new ServersBean();
		ahb.setIp(request.getParameter("ip"));
		ahb.setName(request.getParameter("name"));
		ahb.setOs(request.getParameter("os"));
		ahb.setPassword(request.getParameter("password"));
		ahb.setUserid(request.getParameter("userid"));
		ahb.setHconf(request.getParameter("hconf"));
		ahb.setStatus(request.getParameter("status"));
		ahb.setHvisor(request.getParameter("hvisor"));
		// 封装多选的product mq itm was db2
		ahb.setProduct(encodeProduct(request));
		ahb.setUuid(UUID.randomUUID().toString());
		ObjectNode createServer = om.createObjectNode();
		logger.info(ahb);
		createServer.put("type", request.getParameter("type"));
		createServer.putPOJO("server", ahb);
		int stat = addhostserivce.createOne(createServer.toString());
		if (stat == 1) {
			JSONObject json = new JSONObject();
			json.put("msg", "success");
			request.setAttribute("status", "success");
			return json.toString();// 成功
		} else {
			request.setAttribute("status", "failure");
			JSONObject json = new JSONObject();
			json.put("msg", "failure");
			return json.toString();//
		}
	}

	/*	*//**
			 * 获取需要编辑的服务器的信息
			 *//*
			 * @RequestMapping("/getModifyHost.do")
			 * 
			 * @ResponseBody public JsonNode editHost(HttpServletRequest
			 * request, HttpSession session) {
			 * 
			 * String _id = request.getParameter("_id"); ArrayNode lists =
			 * amsRestService.getList(null, null, "odata/servers?_id=" + _id);
			 * 
			 * JsonNode jn = lists.get(lists.size() - 1);
			 * 
			 * return jn; }
			 */

	/**
	 * 修改服务器信息
	 */
	@RequestMapping("/modifyServer.do")
	@ResponseBody
	public ObjectNode postEditForm(HttpServletRequest request, HttpSession session) {
		ObjectMapper obj = new ObjectMapper();
		String ip = request.getParameter("edit_ip");
		String uuid = request.getParameter("edit_uuid");
		String userid = request.getParameter("edit_userid");
		String password = request.getParameter("edit_password");
		// String os = request.getParameter("edit_os");
		// request.getParameterValues(arg0)
		String[] products = request.getParameterValues("edit_product");
		ObjectNode on = obj.createObjectNode();
		ObjectNode srvon = obj.createObjectNode();

		on.put("type", "modifyServer");
		srvon.put("ip", ip);
		srvon.put("uuid", uuid);
		srvon.put("userid", userid);
		srvon.put("password", password);
		// srvon.put("os", os);
		srvon.put("product", String.join(",", products).toString());
		on.putPOJO("server", srvon);
		logger.info("modifyServer::" + on.toString());
		int stat = addhostserivce.modifyOne(on.toString());
		if (stat == 1) {
			ObjectNode temp = obj.createObjectNode();
			temp.put("msg", "success");
			return temp;
		} else {
			ObjectNode temp = obj.createObjectNode();
			temp.put("msg", "failure");
			return temp;
		}
	}

	@RequestMapping(value = "/checkServerStatus.do")
	@ResponseBody
	public String checkServerStatus(HttpServletRequest request, HttpSession session) {

		String uuids = request.getParameter("selectedServers");
		String data = amsRestService.checkServerStatus(uuids);
		logger.info("获取server 状态信息-->" + data);
		return data;
	}
}
