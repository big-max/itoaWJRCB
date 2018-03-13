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
<jsp:include page="../header.jsp" flush="true" />
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
	overflow-y:scroll;
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
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="tabtitle">
							<ul class="tabnav">
								<li>主机节点</li>
								<li>环境参数</li>
								<li class="active">执行日志</li>
							</ul>
						</div>

						<div class="tabcontent">
								<div class="mainmodule">									
									<h5 class="stairtit swapcon">拓扑结构</h5>
									<p class="twotit" style="padding-left:0;">
										<em class="majornode">单</em>节点1
									</p>
									<div class="column">
										<div class="span12">
											<p>
												<b>主机名:</b> <span id="info_zjm" class="column_txt"></span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<b>IP地址:</b><span id="info_ip" class="column_txt"></span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<b>操作系统:</b><span id="info_os" class="column_txt"><em></em></span>
											</p>
											<p>
												<b>系统配置:</b><span id="info_conf" class="column_txt"></span> 
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<b>状态:</b><span id="info_status" class="column_txt"><em></em></span>
											</p>
										</div>
									</div>
								</div>
						</div>

						<div class="tabcontent">
								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>基本信息
									</h5>
									<div class="form-horizontal">
										<div class="control-group">
											<label class="control-label">安装版本</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="install_version" class="graytxt"></span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">补丁版本</span> 
													<span id="fp_version" class="graytxt"></span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">安装路径</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="install_path" class="graytxt"></span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>配置信息
									</h5>
									<div class="form-horizontal">
										<div class="control-group">
											<label class="control-label">Servername</label>
											<div class="controls">												
												<div class="inputb2l">
													<span id="Servername" class="graytxt"></span>
												</div>											
												<div class="inputb2l">
													<span class="input140 mr20">COMMMethod</span> 
													<span id="COMMMethod" class="graytxt"></span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">TCPPort</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="TCPPort" class="graytxt"></span>
												</div>
												<div class="input50">
													<span class="input140 mr20">TCPServeraddress</span> 
													<span id="TCPServeraddress" class="graytxt"></span>
												</div>
											</div>
										</div>									
										<div class="control-group">
											<label class="control-label">Passwordaccess</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="Passwordaccess" class="graytxt"></span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">managedservices</span> 
													<span id="managedservices" class="graytxt"></span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">nodename</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="nodename" class="graytxt"></span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">baerrorlogname</span> 
													<span id="baerrorlogname" class="graytxt"></span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">apierrorlogname</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="apierrorlogname" class="graytxt"></span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">resourceutilization</span> 
													<span id="resourceutilization" class="graytxt"></span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">include</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="include" class="graytxt"></span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">exclude</span> 
													<span id="exclude" class="graytxt"></span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">enablelanfree</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="enablelanfree" class="graytxt"></span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">lanfreecommmethod</span> 
													<span id="lanfreecommmethod" class="graytxt"></span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">lanfreetcpserveraddress</label>
											<div class="controls">
												<div class="inputb2l">
													<span id="lanfreetcpserveraddress" class="graytxt"></span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">lanfreetcpport</span> 
													<span id="lanfreetcpport" class="graytxt"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
						
						
						<input type="hidden" id="type" name="type" value="${type }">	
                        <input type="hidden" id="uuid" name="uuid" value="${uuid }">
                        <input type="hidden" id="created_time" name="created_time" value="${created_time }">
						<div id="logmsg" class="tabcontent tabnow">
							<textarea id="deplylog" style="background-color:black;width:100%;height:62vh;resize: none;color:white;">
							</textarea> 
						</div>
					</div>
				</div>
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
