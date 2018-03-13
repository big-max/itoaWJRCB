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
.base1{
	width:33%;height:40px;float:left;
}
.canshu{
	width:38%;height:35px;line-height:35px;text-align:right;float:left;
}
.val{
	width:58%;height:35px;line-height:35px;float:right;
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
		
		<div class="easyui-panel" title=">>拓扑结构" style="width:calc(100% - 57px);height:70px;margin-bottom:5px;padding-left:10px;">
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
		
		<form id="tsmInfo" method="post">
			<div class="easyui-panel" title=">>基本信息" style="width:calc(100% - 57px);padding-left:10px;">
				<div class="base1">
					<div class="canshu">安装版本</div>
					<div class="val"><font color="green"><span id="install_version"></span></font></div>
				</div>
				<div class="base1">
					<div class="canshu">补丁版本</div>
					<div class="val"><font color="green"><span id="fp_version"></span></font></div>
				</div>
				<div class="base1">
					<div class="canshu">安装路径</div>
					<div class="val"><font color="green"><span id="install_path"></span></font></div>
				</div>
			</div>
			<div style="width:50px;height:5px;"></div>
			<div class="easyui-panel" title=">>配置信息" style="width:calc(100% - 57px);">
				<div>
					<div class="base1">
						<div class="canshu">Servername</div>
						<div class="val"><font color="green"><span id="Servername"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">COMMMethod</div>
						<div class="val"><font color="green"><span id="COMMMethod"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">TCPPort</div>
						<div class="val"><font color="green"><span id="TCPPort"></span></font></div>
					</div>
				</div>
				
				<div>
					<div class="base1">
						<div class="canshu">TCPServeraddress</div>
						<div class="val"><font color="green"><span id="TCPServeraddress"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">Passwordaccess</div>
						<div class="val"><font color="green"><span id="Passwordaccess"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">managedservices</div>
						<div class="val"><font color="green"><span id="managedservices"></span></font></div>
					</div>
				</div>
				
				<div>
					<div class="base1">
						<div class="canshu">nodename</div>
						<div class="val"><font color="green"><span id="nodename"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">baerrorlogname</div>
						<div class="val"><font color="green"><span id="baerrorlogname"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">apierrorlogname</div>
						<div class="val"><font color="green"><span id="apierrorlogname"></span></font></div>
					</div>
				</div>
				
				<div>
					<div class="base1">
						<div class="canshu">resourceutilization</div>
						<div class="val"><font color="green"><span id="resourceutilization"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">include</div>
						<div class="val"><font color="green"><span id="include"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">exclude</div>
						<div class="val"><font color="green"><span id="exclude"></span></font></div>
					</div>
				</div>
				
				<div>
					<div class="base1">
						<div class="canshu">enablelanfree</div>
						<div class="val"><font color="green"><span id="enablelanfree"></span></font></div>
					</div>
					<div class="base1"></div>
					<div class="base1"></div>
				</div>
				
				<div>
					<div class="base1">
						<div class="canshu">lanfreecommmethod</div>
						<div class="val"><font color="green"><span id="lanfreecommmethod"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">lanfreetcpserveraddress</div>
						<div class="val"><font color="green"><span id="lanfreetcpserveraddress"></span></font></div>
					</div>
					<div class="base1">
						<div class="canshu">lanfreetcpport</div>
						<div class="val"><font color="green"><span id="lanfreetcpport"></span></font></div>
					</div>
				</div>
			</div>
		</form>
		
		<div style="text-align:center;padding:5px 0">
			<a class="easyui-linkbutton" onclick="javascript:history.go(-1);" style="width:80px">上一页</a>
			<a class="easyui-linkbutton" onclick="submit()" style="width:80px">创建</a>
		</div>
	
	</div>
	<!--content end-->

</body>

<script>
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
	
	//获取参数值填入 
	var data_tupo = JSON.parse(localStorage.getItem('baseinfokey'));
	$("#info_zjm").text(data_tupo.zjm);
	$("#info_ip").text(data_tupo.ip);
	$("#info_os").text(data_tupo.os);
	$("#info_conf").text(data_tupo.conf);
	$("#info_status").text(data_tupo.status);
	
	var data_comfirm = JSON.parse(localStorage.getItem('configinfokey'));
	$("#install_version").text(data_comfirm.install_version);
	$("#fp_version").text(data_comfirm.fp_version);
	$("#install_path").text(data_comfirm.install_path);
	$("#Servername").text(data_comfirm.Servername);
	$("#COMMMethod").text(data_comfirm.COMMMethod);
	$("#TCPPort").text(data_comfirm.TCPPort);
	$("#TCPServeraddress").text(data_comfirm.TCPServeraddress);
	$("#Passwordaccess").text(data_comfirm.Passwordaccess);
	$("#managedservices").text(data_comfirm.managedservices);
	$("#nodename").text(data_comfirm.nodename);
	$("#baerrorlogname").text(data_comfirm.baerrorlogname);
	$("#apierrorlogname").text(data_comfirm.apierrorlogname);
	$("#resourceutilization").text(data_comfirm.resourceutilization);
	$("#include").text(data_comfirm.include);
	$("#exclude").text(data_comfirm.exclude);
	$("#enablelanfree").text(data_comfirm.enablelanfree);
	$("#lanfreecommmethod").text(data_comfirm.lanfreecommmethod);
	$("#lanfreetcpserveraddress").text(data_comfirm.lanfreetcpserveraddress);
	$("#lanfreetcpport").text(data_comfirm.lanfreetcpport);
	
	//定义安装TSM客户端所需参数
	var inputStr = {
			"downloadpath":"/tmp/tsmclient",
		    "tsm_version": data_comfirm.install_version,
		    "tsm_binary": "SP_CLIENT_8.1.4_LIN86_M.tar.gz",
		    "tsm_fp": data_comfirm.fp_version,
		    "tsm_path": "",										//？
		    "ftp_user": "itoa",
		    "ftp_password": "itoa",									
		    "ftp_server": "192.168.230.135",					//项目部署所在服务器
		   
		    "tsm_instpath": data_comfirm.install_path,
		    "tsm_server": data_tupo.zjm,
		    "tsm_method": data_comfirm.COMMMethod,
		    "tsm_port": data_comfirm.TCPPort,
		    "tsm_address": data_tupo.ip,
		    "tsm_access": data_comfirm.Passwordaccess,
		    "tsm_service": data_comfirm.managedservices,    
		    "tsm_nodename": data_comfirm.nodename,
		    "tsm_baerrorlog": data_comfirm.baerrorlogname,
		    "tsm_apierrorlog": data_comfirm.apierrorlogname,
		    "tsm_lanfree": data_comfirm.enablelanfree,
		    "tsm_lanfreemethod": data_comfirm.lanfreecommmethod,
		    "tsm_lanfreeaddress": data_comfirm.lanfreetcpserveraddress,
		    "tsm_lanfreeport": data_comfirm.lanfreetcpport,
		    "tsm_utilization": data_comfirm.resourceutilization,
		    "tsm_include": data_comfirm.include,
		    "tsm_exclude": data_comfirm.exclude
		};
	
	//对TSM客户端安装参数进行base64编码
	var encodedStr = Base64.encode(JSON.stringify(inputStr));
	console.log(encodedStr);	
	
	function submit()
	{	
		//拼凑传给后端的data
		var param = {
				  "playbook-uuid": uuid(),
				  "playbook-name": "tsm_client",
				  "product-name": "tsm",
				  "param-content": encodedStr,
				  "nodes": [
				    {
				      "role": 1,
				      "uuid": uuid(),
				      "name": data_tupo.zjm,
				      "address": data_tupo.ip
				    }
				  ]
		};
		
		$.messager.confirm('提示信息', '是否确认要在目标主机立即执行任务？', function(r){
			if (r){
				$.ajax({
					url : "http://192.168.80.154:8000/api/v1/run",
					crossDomain: true,
					type : "post",
					data : JSON.stringify(param),
					success: function (response) {
					   $.messager.alert('提示信息','成功发起任务!','info');
					},
					error: function (xhr, status) {
					   $.messager.alert('提示信息','发起任务失败!','error');
					},
					complete : function(result){
						window.location.href = "getLogInfo.do";
					}
				})
			} else {
				window.history.go(0);
			}
		}); 
	}
</script>
</html>
