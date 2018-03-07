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
.base1{
	width:33%;height:40px;float:left;
}
.textbox-label{
	width:150px;
}
</style>

<script>
	/* 提取sweet提示框代码，以便后面方便使用，减少代码行数 */ 
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}        
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
		
		<div class="easyui-accordion" style="width:calc(100% - 57px);height:70px;">
			<div title=">>拓扑结构" style="padding:10px;">
				<b>主机名 : </b><span id="info_zjm" class="column_txt"></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>IP地址 : </b><span id="info_ip" class="column_txt"></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>操作系统 : </b><span id="info_os" class="column_txt"></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>系统配置 : </b><span id="info_conf" class="column_txt"></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>状态 : </b><span id="info_status" class="column_txt"></span>
			</div>
		</div>
		
		<form id="tsmInfo" method="post">
			<div class="easyui-panel" title=">>基本信息" style="width:calc(100% - 57px);padding:10px;">
				<div class="base1">
					<select class="easyui-combobox" name="install_version" label="安装版本" class="base1_sub"style="width:80%;height:30px;">
						<option value="8.1" selected="selected">v8.1</option>
						<option value="8.2">v8.2</option>
					</select>
				</div>
				
				<div class="base1">
					<select class="easyui-combobox" name="fp_version" label="补丁版本" style="width:80%;height:30px;">
						<option value="8.1" selected="selected">v8.1</option>
						<option value="8.2">v8.2</option>
					</select>
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="install_path" style="width:80%;height:30px;" data-options="label:'安装路径'">
				</div>
			</div>
			<div style="width:50px;height:10px;"></div>
			
			<div class="easyui-panel" title=">>配置信息" style="width:calc(100% - 57px);padding:10px;">
				<div class="base1">  
					<input class="easyui-textbox" name="Servername" style="width:80%;height:30px;" 
					       data-options="label:'Servername',value:'tsmserver'">
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="COMMMethod" style="width:80%;height:30px;" 
					       data-options="label:'COMMMethod',value:'TCPIP'">
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="TCPPort" style="width:80%;height:30px;" 
					       data-options="label:'TCPPort',value:'1500'">
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="TCPServeraddress" style="width:80%;height:30px;" 
					       data-options="label:'TCPServeraddress'">
				</div>
				
				<div class="base1">
					<select class="easyui-combobox" name="Passwordaccess" label="Passwordaccess" style="width:80%;height:30px;">
						<option value="generate" selected="selected">generate</option>
						<option value="prompt">prompt</option>
					</select>
				</div>
				
				<div class="base1">
					<select class="easyui-combobox" name="managedservices" label="managedservices" style="width:80%;height:30px;" multiple>
						<option value="mws" selected="selected">Magagedservices webclient schedule</option>
						<option value="mw">Managedservices webclient</option>
						<option value="ms">Managedservices schedule</option>
					</select>
				</div>
				
				<div class="base1">  
					<input class="easyui-textbox" name="nodename" style="width:80%;height:30px;" 
					       data-options="label:'nodename'">
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="errorlogname" style="width:80%;height:30px;" 
					       data-options="label:'errorlogname',value:'/usr/tivoli/tsm/client/api/bin64/dsmerror.log'">
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="resourceutilization" style="width:80%;height:30px;" 
					       data-options="label:'resourceutilization'">
				</div>
				
				<div class="base1">  
					<input class="easyui-textbox" name="include" style="width:80%;height:30px;" 
					       data-options="label:'include'">
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="exclude" style="width:80%;height:30px;" 
					       data-options="label:'exclude'">
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" name="enablelanfree" style="width:80%;height:30px;" 
					       data-options="label:''">
				</div>
				
				<div>
					<div class="base1">  
						<input class="easyui-textbox" name="lanfreecommmethod" style="width:80%;height:30px;" 
						       data-options="label:'lanfreecommmethod',value:'TCPIP'">
					</div>
					
					<div class="base1">  
						<input class="easyui-textbox" name="lanfreetcpserveraddress" style="width:80%;height:30px;" 
						       data-options="label:'lanfreetcpserveraddress'">
					</div>
					
					<div class="base1">  
						<input class="easyui-textbox" name="lanfreetcpport" style="width:80%;height:30px;" 
						       data-options="label:'lanfreetcpport',value:'1500'">
					</div>
				</div>
			</div>
		</form>
		
		<div style="text-align:center;padding:5px 0">
			<a class="easyui-linkbutton" onclick="javascript:history.go(-1);" style="width:80px">上一页</a>
			<a class="easyui-linkbutton" onclick="nextPage()" style="width:80px">下一页</a>
		</div>
	
	</div>

</body>

<script>
	//拓扑结构的信息 
	var data_tupo = JSON.parse(localStorage.getItem('baseinfokey'));
	$("#info_zjm").text(data_tupo.zjm);
	$("#info_ip").text(data_tupo.ip);
	$("#info_os").text(data_tupo.os);
	$("#info_conf").text(data_tupo.conf);
	$("#info_status").text(data_tupo.status);
	
	//点击“下一页”跳转页面
	function nextPage()
	{
		var configinfo = {
				version : "v8.1"
		};
		localStorage.setItem('configinfokey', JSON.stringify(configinfo));
		window.location.href = "getIBMAllInstance.do?ptype=tsmclientToNextPage";
	}
</script>
</html>
