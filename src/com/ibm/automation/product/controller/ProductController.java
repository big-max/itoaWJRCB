package com.ibm.automation.product.controller;

import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.ibm.automation.core.util.PropertyUtil;

@RestController
public class ProductController {
	public static Logger logger = Logger.getLogger(ProductController.class);
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/ams2.properties");
	
	/**
	 * 为了健康检查用的下拉框判断
	 */
	@RequestMapping("/getProduct.do")
	public ArrayNode getProductName()
	{
		String allProduct = amsprop.getProperty("product");
		ObjectMapper om = new ObjectMapper();
		ArrayNode an = om.createArrayNode();
		for (String s : allProduct.split(","))
		{
			an.add(s);
		}
		
		return an;
	}
	public static void main(String[] args) {
		ProductController pc = new ProductController();
		System.out.println(pc .getProductName());
	}
}
