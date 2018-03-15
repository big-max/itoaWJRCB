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

<style>
.bcg {
	background: #00ec00;
}
.bcr {
	background: #ff8080;
}
.bcb {
	background: #8080ff;
}
.bcy {
	background: yellow;
}
.input200 {
	display: inline-block;
	width: 200px;
	margin-top: 2px;
	text-align: right;
}
#logTable3 tr{
	height:25px;
}
body,ul li,.graytxt,.input140,span{
	font-size:13px;
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
.input140,.graytxt{ 
	font-size: 13px; 
}
.input50{
	display:inline-block;
	width:50%;
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

<script type="text/javascript">
	$(document).ready(function() 
	{
		giveTdColor1();//主要用于手动页面刷新
		//用于获取点击失败、的原因						
		$("#logTable3 tbody").on("click", "tr td", function () {
			var uuid = $("#uuid").val().trim();
			selectedRecord = $(this).html().trim();
			if(selectedRecord=='失败')
			{
			$.ajax({
				url : '<%=path%>/getErrMsg.do?playbook_uuid='+uuid,
				type : 'get',
				dataType : "json",
				error : function(err) {
					//alert(err['errmsg'])
				},
				success:function(data)
				{
					
					ymPrompt.win({
						width: 500, //宽 
						height: 250, //高 
						message : data['errmsg'],
						title : '错误提示！',
						maxBtn:true,
						handler : function(tp) {},
						btn : [ [ '是', 'yes' ]]
					});
				}
			})
		  }
		});
	});
</script>

<script type="text/javascript">
function giveTdColor1()
{
	//给td添加颜色
	trObject = $("#logTable3 tbody").find("tr");
	for (var i = 0; i < trObject.length; i++) 
	{
		var tdText = $(trObject[i]).find("td:last");
		if (tdText.html().trim() == "成功") 
		{
			tdText.removeClass();
			tdText.addClass("bcg");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-success ine-block w100");			
		}
		if (tdText.html().trim() == "失败") 
		{
			tdText.removeClass();
			tdText.addClass("bcr");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-danger ine-block w100");
		}
		if (tdText.html().trim() == "运行中") 
		{
			tdText.removeClass();
			tdText.addClass("bcb");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-primary ine-block w100 active");
		}
		if (tdText.html().trim() == "跳过") 
		{
		//	$(trObject[i]).remove();
		//	tdText.remove();//删除跳过的行
			tdText.removeClass();
			tdText.addClass("bcy");
		}
	}
}

//ajax 更新每个task的状态信息
function giveTdColor(data)
{
	//给td添加颜色
	$('#logTable3 tbody tr').each(function()
	{
	    var tdText=	$(this).find("td:last");
	    var tdStep = $(this).find("td:first");
	    var tdStep_next  = $(this).find('td:first').find("input");
	   	tdText.text(data[tdStep_next.val()]);
		if (tdText.html().trim() == "成功") 
		{
			tdText.removeClass();
			tdText.addClass("bcg");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-success ine-block w100");				
		}
		if (tdText.html().trim() == "失败") 
		{
			tdText.removeClass();
			tdText.addClass("bcr");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-danger ine-block w100");
		}
		if (tdText.html().trim() == "运行中") 
		{
			tdText.removeClass();
			tdText.addClass("bcb");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-primary ine-block w100 active");
		}			
		if (tdText.html().trim() == "跳过") 
		{
			$(this).remove();//删除跳过的行
			tdText.removeClass();
			tdText.addClass("bcy");
		}
	})
}

function getInstallMsg() 
{
	var uuid = $("#uuid").val().trim();
	var type = $("#type").val().trim();
	var created_time = $("#created_time").val().trim();
	$.ajax({
		url : '<%=path%>/nodeInstall.do',
		type : 'post',
		data : {
			uuid:uuid,
			type:type,
			created_time:created_time
		},
		
		error : function() {
			//alert("获取安装信息异常！");
		},
		success : function(data) 
		{
			$("#deplylog").html(data);
		}
	});
}

function myrefresh() 
{
	if (($("#logmsg").attr("class") == 'tabcontent tabnow')) 
	{
		getInstallMsg();
	}
}   

window.setInterval('myrefresh()',3000);  //每隔3秒自动刷新一次
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
			<a href="getLogInfo.do" class="current1" style="position:relative;top:-3px;"><i class="icon-home"></i>历史执行日志</a> 
			<a href="#" class="current" style="position:relative;top:-3px;">任务信息</a>
		</div>
		
		<div class="easyui-tabs" style="width:calc(100% - 57px);height:auto;padding:10px;">
			<div title="主机节点" style="padding:10px">
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
			<div title="环境参数" style="padding:10px">
				<div class="easyui-panel" title=">>基本信息" style="width:100%;padding-left:20px;">
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
				<div class="easyui-panel" title=">>配置信息" style="width:100%;"> 
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
			</div>
			<div title="执行日志" style="padding:10px" data-options="selected:true">
				<input type="hidden" id="type" name="type" value="${type }">	
                <input type="hidden" id="uuid" name="uuid" value="${uuid }">
                <input type="hidden" id="created_time" name="created_time" value="${created_time }">
				<textarea id="deplylog" style="background-color:black;width:100%;height:68vh;resize: none;color:white;">
				</textarea> 
			</div>
		</div>

	</div>
</body>

<script>
	//获取主机节点——拓扑结构填入  
	var data_tupo = JSON.parse(localStorage.getItem('baseinfokey'));
	$("#info_zjm").text(data_tupo.zjm);
	$("#info_ip").text(data_tupo.ip);
	$("#info_os").text(data_tupo.os);
	$("#info_conf").text(data_tupo.conf);
	$("#info_status").text(data_tupo.status);
	
	//环境参数 
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
</script>
</html>
