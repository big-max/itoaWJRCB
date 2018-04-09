package com.ibm.automation.autopublish.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.ams.util.AmsClient;
import com.ibm.automation.ams.util.AmsV2ClientHttpClient4Impl;
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.exception.NetWorkException;
import com.ibm.automation.core.service.FpService;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.core.util.EncodeUtil;
import com.ibm.automation.core.util.FormatUtil;
import com.ibm.automation.core.util.HttpClientUtil;
import com.ibm.automation.core.util.PropertyUtil;
import com.ibm.automation.core.util.ServerUtil;
import com.ibm.automation.ihs.controller.IHSController;

import net.sf.json.JSONObject;

@Controller
public class AutoPublishWasController {
	@Autowired
	private AmsRestService amsRestService;
	@Autowired
	private ServerService serverService;
	@Autowired
	private FpService fpService;
	AmsClient amsClient = new AmsV2ClientHttpClient4Impl();
	ObjectMapper om = new ObjectMapper();
	private static Logger logger = Logger.getLogger(AutoPublishWasController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	
	@RequestMapping("/autopublish.do")
	public String autopublish(HttpServletRequest request, HttpSession session) {
		return "autopublish/instance_autopublish_was";
	}
	
	@RequestMapping("/autopublishEsb.do")
	public String autopublishEsb(HttpServletRequest request, HttpSession session) {
		return "autopublish/instance_autopublish_esb_main";
	}
}
