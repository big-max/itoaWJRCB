package com.ibm.automation.publish.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.automation.core.service.PublishRecordService;
import com.ibm.automation.domain.publish_recordBean;

import net.sf.json.JSONArray;

@Controller
public class PublishController {
	@Autowired
	public PublishRecordService publishRecordService;
	
	@RequestMapping("/getAllPubRecord.do")
	@ResponseBody
	public JSONArray getAllPubRecord(){
		List<publish_recordBean> mylist = publishRecordService.getAllPubRecords();
		JSONArray array = JSONArray.fromObject(mylist);
		return array;
	}
}
