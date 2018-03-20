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
	/* overflow-y:scroll; */
}
.current1,.current1:hover {
    color: #444444;
}
.base1{
	width:33%;height:40px;float:left;
}
</style>
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
		
		<div class="easyui-panel" title=">>拓扑结构" style="width:calc(100% - 57px);height:70px;margin-bottom:5px;padding-left:10px;padding-top:8px;">
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
		
		<form id="tsmInfo" method="post" data-options="novalidate:true">
			<div class="easyui-panel" title=">>基本信息" style="width:calc(100% - 57px);padding:10px;">
				<div class="base1">
					<select class="easyui-combobox" id="install_version" name="install_version" label="安装版本" style="width:90%;height:30px;">
						<option value="SP_CLIENT_8.1.4_LIN86_M.tar.gz" selected="selected">8.1</option>
					</select>
				</div>
				
				<div class="base1">
					<select class="easyui-combobox" id="fp_version" name="fp_version" label="补丁版本" style="width:90%;height:30px;">
						<option value="-" selected="selected">8.1.4</option>
					</select>
				</div>
				
				<div class="base1">
					<input class="easyui-textbox" id="install_path" name="install_path" style="width:90%;height:30px;" 
						   data-options="label:'安装路径',required:true">
				</div>
			</div>
			<div style="width:50px;height:5px;"></div>
			
			<div class="easyui-panel" title=">>配置信息" style="width:calc(100% - 57px);padding:10px;">
				<div>
					<div class="base1">  
						<input class="easyui-textbox" id="Servername" name="Servername" style="width:90%;height:30px;" 
						       data-options="label:'Servername',value:'tsmserver',required:true">
					</div>
					
					<div class="base1">
						<input class="easyui-textbox" id="COMMMethod" name="COMMMethod" style="width:90%;height:30px;" 
						       data-options="label:'COMMMethod',value:'TCPIP',required:true">
					</div>
					
					<div class="base1">
						<input class="easyui-textbox" id="TCPPort" name="TCPPort" style="width:90%;height:30px;" 
						       data-options="label:'TCPPort',value:'1500',required:true">
					</div>
				</div>
				
				<div>
					<div class="base1">
						<input class="easyui-textbox" id="TCPServeraddress" name="TCPServeraddress" style="width:90%;height:30px;" 
						       data-options="label:'TCPServeraddress',value:'127.0.0.1',required:true">
					</div>
				
					<div class="base1">
						<select class="easyui-combobox" id="Passwordaccess" name="Passwordaccess" label="Passwordaccess" style="width:90%;height:30px;">
							<option value="generate" selected="selected">generate</option>
							<option value="prompt">prompt</option>
						</select>
					</div>
				
					<div class="base1">
						<select class="easyui-combobox" id="managedservices" name="managedservices" label="managedservices" style="width:90%;height:30px;" multiple>
							<option value="Magagedservices webclient schedule" selected="selected">Magagedservices webclient schedule</option>
							<option value="Managedservices webclient">Managedservices webclient</option>
							<option value="Managedservices schedule">Managedservices schedule</option>
						</select>
					</div>
				</div>
				
				<div>
					<div class="base1">  
						<input class="easyui-textbox" id="nodename" name="nodename" style="width:90%;height:30px;" 
						       data-options="label:'nodename',value:'name',required:true">
					</div>
				
					<div class="base1">
						<input class="easyui-textbox" id="baerrorlogname" name="baerrorlogname" style="width:90%;height:30px;" 
						       data-options="label:'baerrorlogname',required:true">
					</div>
				
					<div class="base1">
						<input class="easyui-textbox" id="apierrorlogname" name="apierrorlogname" style="width:90%;height:30px;" 
						       data-options="label:'apierrorlogname',required:true">
					</div>
				</div>
				
				<div>
					<div class="base1">
						<input class="easyui-textbox" id="resourceutilization" name="resourceutilization" style="width:90%;height:30px;" 
						       data-options="label:'resourceutilization',value:'resourceutilization',required:true">
					</div>
				
					<div class="base1">  
						<input class="easyui-textbox" id="include" name="include" style="width:90%;height:30px;" 
						       data-options="label:'include',value:'include',required:true">
					</div>
				
					<div class="base1">
						<input class="easyui-textbox" id="exclude" name="exclude" style="width:90%;height:30px;" 
						       data-options="label:'exclude',value:'exclude',required:true">
					</div>
				</div>
				
				<div style="margin-bottom:10px;">
					<div style="width:150px;float:left;">enablelanfree</div>
					<div>
						<input type="radio" name="enablelanfree" value="Yes" checked>Yes
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="enablelanfree" value="No">No
					</div>
				</div>
				
				<div id="lanfreeshow">
					<div class="base1">  
						<input class="easyui-textbox" id="lanfreecommmethod" name="lanfreecommmethod" style="width:90%;height:30px;" 
						       data-options="label:'lanfreecommmethod',value:'TCPIP',required:true">
					</div>
					
					<div class="base1">  
						<input class="easyui-textbox" id="lanfreetcpserveraddress" name="lanfreetcpserveraddress" style="width:90%;height:30px;" 
						       data-options="label:'lanfreetcpserveraddress',value:'127.0.0.1',required:true">
					</div>
					
					<div class="base1">  
						<input class="easyui-textbox" id="lanfreetcpport" name="lanfreetcpport" style="width:90%;height:30px;" 
						       data-options="label:'lanfreetcpport',value:'1500',required:true">
					</div>
				</div>
			</div>
		</form>
		
		<!-- <div style="text-align:center;padding:5px 0">
			<a class="easyui-linkbutton" onclick="javascript:history.go(-1);" style="width:80px">上一页</a>
			<a class="easyui-linkbutton" onclick="nextPage()" style="width:80px">下一页</a>
		</div> -->
		
		<div class="columnfoot" style="width: 93%; left: 5%;">
			<a class="btn btn-info btn-up" onclick="javascript:history.go(-1);">
				<i class="icon-btn-up"></i> <span>上一页</span>
			</a> 
			<a class="btn btn-info fr btn-down" onclick="nextPage()"> 
				<span>下一页</span><i class="icon-btn-next"></i>
			</a>
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
	
	
	//根据linux还是aix自动识别：安装路径，baerrorlogname，apierrorlogname(linux为opt，aix为usr) 
	$(document).ready(function(){
		var os_type = data_tupo.os.toLowerCase();
		var patt = new RegExp("aix");
		var result = patt.test(os_type);
		if(result == true){			
			$('#install_path').textbox('setValue','/usr/tivoli/tsm/client');
			$('#baerrorlogname').textbox('setValue','/usr/tivoli/tsm/client/ba/bin/dsmerror.log');
			$('#apierrorlogname').textbox('setValue','/usr/tivoli/tsm/client/api/bin64/dsierror.log');
		}
		else{			
			$('#install_path').textbox('setValue','/opt/tivoli/tsm/client');
			$('#baerrorlogname').textbox('setValue','/opt/tivoli/tsm/client/ba/bin/dsmerror.log');
			$('#apierrorlogname').textbox('setValue','/opt/tivoli/tsm/client/api/bin64/dsierror.log');
		}
	})
	
	
	//点击enablelanfree的yes or no按钮，切换显示/隐藏后面是三个参数 
	$("input[type=radio]:first").click(function(){
		$("#lanfreeshow").show();
	})
	$("input[type=radio]:last").click(function(){
		$("#lanfreeshow").hide();
	}) 
	
	//获取form表单，转换为json串 
	function getFormJson(frm) {  //frm：form表单的id
        var o = {};  
        var a = $("#"+frm).serializeArray();  
        $.each(a, function() {  
            if (o[this.name] !== undefined) {  
                if (!o[this.name].push) {  
                    o[this.name] = [ o[this.name] ];  
                }  
                o[this.name].push(this.value || '');  
            } else {  
                o[this.name] = this.value || '';  
            }  
        });  
        return o;  
    }
	
	//点击“下一页”跳转页面
	function nextPage()
	{	
		var install_path = $("#install_path").val();
		if(install_path == "")
		{
			$.messager.alert('提示信息','安装路径不能为空!','info');
		}
		
		var configinfo = getFormJson("tsmInfo");
		localStorage.setItem('configinfokey', JSON.stringify(configinfo));
		window.location.href = "getIBMAllInstance.do?ptype=tsmclientToNextPage";
	}
</script>
</html>
