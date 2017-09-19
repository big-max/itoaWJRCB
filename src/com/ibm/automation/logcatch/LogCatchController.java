package com.ibm.automation.logcatch;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.ServerUtil;

@Controller
public class LogCatchController {

	@Autowired
	private ServerService serverService;
	private static Logger logger = Logger.getLogger(LogCatchController.class);
	ObjectMapper om = new ObjectMapper();

	@RequestMapping("/logCatch")
	public String logCatch(HttpServletRequest request, HttpSession session) {
		String strOrgUrl = serverService.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_configCompare_getCCInfo);
		String retMsg = null;
		try {
			retMsg = HttpClientUtil.postMethod(strOrgUrl, "{}");
		} catch (NetWorkException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error("获取配置比对信息出错，原因为：" + e.getMessage());
			return "redirect:/500.jsp";
		}
		JsonNode retJson = null;
		try {
			retJson = om.readTree(retMsg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg = retJson.get("msg").asText();
		JsonNode innerJson = null;
		try {
			innerJson = om.readTree(msg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/500.jsp";
		}
		// return innerJson;
		List<String> list = new ArrayList<String>();
		Iterator<JsonNode> iter = innerJson.iterator();
		while (iter.hasNext()) {
			String temp = iter.next().asText();
			list.add(temp);
		}
		List<LogCatchCreateBean>  lccblist = ServerUtil.getLogCatch("/api/v1/logcatch");
		request.setAttribute("jobs", lccblist);
		request.setAttribute("totalIPList", list);
		return "logCatch";
	}

	/**
	 * 新建添加一个日志抓取任务
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/addLogCatch.do")
	@ResponseBody
	public String addLogCatch(HttpServletRequest request, HttpSession session) {
		LogCatchCreateBean lccb = new LogCatchCreateBean();
		String strOrgUrl = serverService.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_logCatch_jobs);
		try {
			BeanUtils.populate(lccb, request.getParameterMap());
			BeanUtils.copyProperty(lccb, "database", request.getParameter("db"));
			BeanUtils.copyProperty(lccb, "task_timestamp",convertDatetime(new Date()));
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
			request.setAttribute("errmsg", e1.getMessage());
			logger.error("addLogCatch::获取参数失败，失败原因为" + e1.getMessage());
			return "redirect:/500.jsp";
		}
		
		if (lccb.getProduct().equalsIgnoreCase("mq")) {
			try {
				String retMsg= HttpClientUtil.postMethod(strOrgUrl, lccb.toString());
				logger.info("LogCatch::mq 获取返回信息"+retMsg);
				return retMsg;
			} catch (NetWorkException | IOException e) {
				// TODO Auto-generated catch block
				logger.error("网络或者IO错误，错误原因为："+e.getMessage());
				request.setAttribute("errmsg", e.getMessage());
				return "redirect:/500.jsp";
			}
		} else if (lccb.getProduct().equalsIgnoreCase("db2")) {
			try {
				String retMsg = HttpClientUtil.postMethod(strOrgUrl, lccb.toString());
				logger.info(retMsg);
				return retMsg;
			} catch (NetWorkException | IOException e) {
				logger.error("网络或者IO错误，错误原因为：" + e.getMessage());
				request.setAttribute("errmsg", e.getMessage());
				return "redirect:/500.jsp";
			}
		} else if (lccb.getProduct().equalsIgnoreCase("was")) {
			try {
				String retMsg = HttpClientUtil.postMethod(strOrgUrl, lccb.toString());
				logger.info(retMsg);
				return retMsg;
			} catch (NetWorkException | IOException e) {
				logger.error("网络或者IO错误，错误原因为：" + e.getMessage());
				request.setAttribute("errmsg", e.getMessage());
				return "redirect:/500.jsp";
			}
		} else {
			logger.info("not support.");
		}

		return null;
	}

	

	
	/**
	 * 下载文件
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/logCatch_download_log.do", method = RequestMethod.GET)
	public void logCatch_download_log(HttpServletRequest request, HttpServletResponse response) {
		String strOrgUrl = serverService.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_logCatch_logDownload);
		String uuid = request.getParameter("_id");
		String product = request.getParameter("product");
		String ip = request.getParameter("ip");
		ObjectNode sendJson = om.createObjectNode();
		sendJson.put("_id", uuid);

		try {
			String retMsg = HttpClientUtil.postMethod(strOrgUrl, sendJson.toString());
			//response.setCharacterEncoding("utf-8");
			response.setContentType("application/ostet-stream");
			response.setHeader("Content-Disposition", "attachment;fileName=" + (ip+"-"+product+".zip"));
			PrintWriter pw = response.getWriter();
			pw.write(retMsg);
			pw.flush();
			pw.close();

		} catch (NetWorkException | IOException e) {
			e.printStackTrace();
			logger.error("LogCatchController -- > 下载文件中，出现错误：" + e.getMessage());
		}
	}
	/**
	 * 删除巡检任务，主要用于定时任务、每日循环任务的处理
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/deleteLog.do")
	@ResponseBody
	public String deleteLog(HttpServletRequest request, HttpSession session) {
		String strOrgUrl = serverService.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_logCatch_jobs);
		String job_uuid = request.getParameter("job_uuid");// 巡检任务类型
		ObjectNode delete_param = om.createObjectNode();
		delete_param.put("log_uuid", job_uuid);
		delete_param.put("operType", "deleteLog");
		delete_param.put("userName", (String)request.getSession().getAttribute("userName"));
		try {
			String retMsg = HttpClientUtil.postMethod(strOrgUrl, delete_param.toString());
			logger.info("deletejob::收到数据" + retMsg);
			return retMsg;
		} catch (NetWorkException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error("deletejob::发生异常，异常为：" + e.getMessage());
		}
		return null;
	}
	public String convertDatetime(Date date)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String datetime= sdf.format(date);
		return datetime;
	}
}
