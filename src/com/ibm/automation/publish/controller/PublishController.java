package com.ibm.automation.publish.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.automation.ams.service.AmsRestService;
import com.ibm.automation.core.constants.PropertyKeyConst;
import com.ibm.automation.core.service.PublishRecordService;
import com.ibm.automation.core.service.ServerService;
import com.ibm.automation.domain.publish_recordBean;

import net.sf.json.JSONArray;

@Controller
public class PublishController {
	@Autowired
	private AmsRestService amsRestService;
	@Autowired
	private ServerService serverService;
	@Autowired
	public PublishRecordService publishRecordService;
	public static final String APP_FILE_PATH = "/home/data/itoa/deploy/esb/app"; // APP保存的文件路径
	public static final String DB_FILE_PATH = "/home/data/itoa/deploy/esb/db"; // DB文件保存的文件路径
	public static final String APP_FILE_TYPE = "SmartESB_AP_V%s_%s.zip";
	public static final String DB_FILE_TYPE = "SmartESB_DB_V%s_%s.zip";

	@RequestMapping("/getAllPubRecord.do")
	@ResponseBody
	public JSONArray getAllPubRecord() {
		List<publish_recordBean> mylist = publishRecordService.getAllPubRecords();
		JSONArray array = JSONArray.fromObject(mylist);
		return array;
	}

	// 根据文件的类型保存文件
	public boolean saveFile(MultipartFile file,  String filePath) {
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			File filepath = new File(filePath, filename);
			if (!filepath.getParentFile().exists()) {
				filepath.getParentFile().mkdirs();
			}
			try {
				file.transferTo(new File(filePath + File.separator + filename));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return true;
		}
		return false;

	}

	@RequestMapping("/postFormElement.do")
	public String postFormElement(HttpServletRequest request, @RequestParam("esb_type") String[] esb_type,
			@RequestParam("esb_appfile") MultipartFile esb_appfile,
			@RequestParam("esb_dbfile") MultipartFile esb_dbfile, @RequestParam("esb_appserver") String esb_appserver,
			@RequestParam("esb_dbserver") String esb_dbserver) {
		if (esb_type != null) { // esb 类型不为空
			for (int i = 0; i < esb_type.length; i++) {
				if (esb_type[i].equals("0")) { // 表示app选中
					saveFile(esb_appfile,  APP_FILE_PATH); // 保存app
				} else if (esb_type[i].equals("1")) { // 表示db选中
					saveFile(esb_dbfile,  DB_FILE_PATH); // 保存db
				}

			}
		}
		return "autopublish/instance_autopublish_esb_submit";
	}

	@RequestMapping("/autopublishEsb.do")
	public String autopublishEsb(HttpServletRequest request, HttpSession session) {
		String strOrgUrl = serverService.createSendUrl(PropertyKeyConst.AMS2_HOST,
				PropertyKeyConst.POST_ams2_autopublish);
		ObjectNode myNode = amsRestService.getList_one(null, null, "/api/v1/autopublish?systype=esb");
		System.out.println(myNode);
		List<String> appList = new ArrayList<String>();
		for (JsonNode jn : myNode.get("app")){
			appList.add(jn.asText());
		}
		List<String> dbList = new ArrayList<String>();
		for (JsonNode jn : myNode.get("db")){
			dbList.add(jn.asText());
		}
		request.setAttribute("appList", appList);
		request.setAttribute("dbList", dbList);
		return "autopublish/instance_autopublish_esb_main";
	}

	@RequestMapping("/toStepSelect.do")
	public String toStepSelect(HttpServletRequest request, HttpSession session) {
		return "autopublish/instance_autopublish_esb_select";
	}

	@RequestMapping("/toStepSubmit.do")
	public String toStepSubmit(HttpServletRequest request, HttpSession session) {
		return "autopublish/instance_autopublish_esb_submit";
	}

	@RequestMapping("/toStepChange.do")
	public String toStepChange(HttpServletRequest request, HttpSession session) {
		return "autopublish/instance_autopublish_esb_change";
	}

}
