package com.ibm.automation.publish.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ibm.automation.core.service.PublishRecordService;
import com.ibm.automation.domain.publish_recordBean;

import net.sf.json.JSONArray;

@Controller
public class PublishController {
	@Autowired
	public PublishRecordService publishRecordService;
	public static final String APP_FILE_PATH = "/home/data/itoa/deploy/esb/app"; // APP保存的文件路径
	public static final String DB_FILE_PATH = "/home/data/itoa/deploy/esb/db"; // DB文件保存的文件路径

	@RequestMapping("/getAllPubRecord.do")
	@ResponseBody
	public JSONArray getAllPubRecord() {
		List<publish_recordBean> mylist = publishRecordService.getAllPubRecords();
		JSONArray array = JSONArray.fromObject(mylist);
		return array;
	}

	// 根据文件的类型保存文件
	public boolean saveFile(MultipartFile file, String filePath) {
		if (!file.isEmpty()) {
			// 上传文件名
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
					saveFile(esb_appfile, APP_FILE_PATH); // 保存app
				} else if (esb_type[i].equals("1")) { // 表示db选中
					saveFile(esb_dbfile, DB_FILE_PATH); // 保存db
				}

			}
		}
		return "autopublish/instance_autopublish_esb_submit";
	}
	@RequestMapping("/autopublishEsb.do")
	public String autopublishEsb(HttpServletRequest request, HttpSession session) {
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
