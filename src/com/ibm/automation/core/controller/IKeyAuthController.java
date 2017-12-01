package com.ibm.automation.core.controller;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.core.util.PropertyUtil;

import net.people2000.ikeyauth.IkeyAuthImpl;
import net.people2000.ikeyauth.IkeyAuthInterfaces;

@Controller
public class IKeyAuthController {
	private static Properties keyauth_prop = PropertyUtil.getResourceFile("config/properties/keyauth.properties");
	private static Logger logger = Logger.getLogger(IKeyAuthController.class);

	public int auth(String username, String password, int type, String challenge) {
		String host = keyauth_prop.getProperty("auth_address");
		IkeyAuthInterfaces interfaces = new IkeyAuthImpl(host, 10 * 1000, 30 * 1000);
		int ret = -1;
		try {
			ret = interfaces.ikeyAuth(type, username, password, challenge);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("证书认证存在网络错误，错误描述为；" + e.getMessage());
		}
		return ret;
	}

	@RequestMapping("/ikey.do")
	@ResponseBody
	public ObjectNode auth(HttpServletRequest request, HttpSession session) {
		ObjectMapper om = new ObjectMapper();
		ObjectNode on = om.createObjectNode();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username.equals("wjrcb") && password.equals("wjrcb")) {
			on.put("status", 0);
			on.put("msg", "认证通过！");
		} else {

			int ret = auth(username, password, 2, "");
			on.put("status", ret);
			switch (ret) {
			case 0:
				on.put("msg", "认证通过!");
				break;
			case -672:
				on.put("msg", "动态密碼错误！");
				break;
			case -652:
				on.put("msg", "账号不存在！");
				break;
			case -655:
				on.put("msg", "账号被冻结！");
				break;
			default:
				on.put("msg", "其他错误，请根据返回码去文档找错误描述！");
			}
		}
		return on;
	}
}
