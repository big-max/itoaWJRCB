<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.fasterxml.jackson.databind.*"%>
<%@ page import="com.fasterxml.jackson.databind.node.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="../header_easyui.jsp" flush="true" />
<link type="text/css" title="www" rel="stylesheet" href="/css/easyui.css" />
<link type="text/css" title="www" rel="stylesheet" href="/css/icon.css" />
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/doBase64.js"></script>
<title>自动化运维平台</title>
<style type="text/css">
body{
	overflow:hidden;
}
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
	overflow-y:scroll;
}
.current1,.current1:hover {
    color: #444444;
}
</style>

<script>
	/* 提取sweet提示框代码，以便后面方便使用，减少代码行数 */ 
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}        
	
	//定义生成uuid的方法
	function uuid() {
	    var s = [];
	    var hexDigits = "0123456789abcdef";
	    for (var i = 0; i < 36; i++) {
	        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
	    }
	    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
	    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
	    s[8] = s[13] = s[18] = s[23] = "-";
	 
	    var uuid = s.join("");
	    return uuid;
	}
	
	//定义安装TSM客户端所需参数
	var inputStr = {
			"servername":"tsmserver",
			"COMMMethod":"TCPIP",
			"TCPPort":"1500",
			"TCPServeraddress":"192.168.80.129",
			"Passwordaccess":"generate",
			"managedservices":"schedule",
			"nodename":"tsm1",
			"resourceutilization":"xx",
			"errorlogname":"/usr/tivoli/tsm/client/api/bin64/dsmerror.log",
			"enablelanfree":"yes",
			"lanfreecommmethod":"tcpip",
			"lanfreetcpserveraddress":"127.0.0.1",
			"lanfreetcpport":"1500",
			"include":"xx",
			"exclude":"xx",
			"install_version":"xx",
			"fp_version":"xx",
			"install_path":"xx"
		};
	
	//对TSM客户端安装参数进行base64编码
	var encodedStr = Base64.encode(JSON.stringify(inputStr));
	console.log(encodedStr);
	//拼凑传给后端的data
	var param = {
			  "playbook-uuid": uuid(),
			  "playbook-name": "tsm",
			  "product-name": "tsm",
			  "param-content": encodedStr,
			  "nodes": [
			    {
			      "role": 1,
			      "uuid": uuid(),
			      "name": "deploy3",
			      "address": "192.168.80.162"
			    }
			  ]
			};
	
</script>
</head>

<body>
	<!--header start-->
	<div class="header">
		<jsp:include page="../topleft_close.jsp" flush="true" />
	</div> 
	<!--header end-->

	<!--content start-->
	<div class="content">
		<div class="breadcrumb">
			<a href="getAllServers.do" class="current1" style="position:relative;top:-3px;"><i class="icon-home"></i>IBM TSM</a> 
			<a class="current" style="position:relative;top:-3px;">实例配置详细</a>
		</div>
		
		<div class="easyui-panel" title=">>基本信息" style="width:calc(100% - 57px);padding:30px;">
			<form id="tsmInfo" method="post">
				<div style="margin-bottom:20px">
					<span>安装版本</span> <span id="version"></span>
				</div>
			</form>
		</div>
		<div style="text-align:center;padding:5px 0">
			<a class="easyui-linkbutton" onclick="javascript:history.go(-1);" style="width:80px">上一页</a>
			<a class="easyui-linkbutton" onclick="submit()" style="width:80px">创建</a>
		</div>
	
	</div>
	<!--content end-->

</body>

<script>
	//获取参数值填入 
	var data_comfirm = JSON.parse(localStorage.getItem('configinfokey'));
	$("#version").text(data_comfirm.version);
	
	function submit()
	{	
		$.messager.confirm('提示信息', '是否确认要在目标主机立即执行任务？', function(r){
			if (r){
				//$("#submits").submit();
				$.ajax({
					url : "",
					type : "post",
					data : ""
				})
			} else {
				window.history.go(0);
			}
		}); 
	}
</script>
</html>
