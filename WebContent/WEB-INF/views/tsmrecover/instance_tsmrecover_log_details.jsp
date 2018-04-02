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
	width:35%;height:35px;line-height:35px;text-align:right;float:left;
}
.val{
	width:61%;height:35px;line-height:35px;float:right;
}
.newmain{width:40%;height:30px;float:left;}
.newmain1{width:30%;height:30px;line-height:30px;text-align:right;float:left;}
.newmain2{width:65%;height:30px;line-height:28px;float:right;}
</style>

<script type="text/javascript">
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}
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
	var uuid = getUrlParam("uuid");
	var type = getUrlParam("type");
	var created_time =getUrlParam("created_time");
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

window.setInterval('getInstallMsg()',3000);  //每隔3秒自动刷新一次
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
				<div>
					<div class="newmain">
						<div class="newmain1">恢复类型</div>
						<div class="newmain2"><span id="source_time">Database</span></div>
					</div>
					<div class="newmain">
						<div class="newmain1">恢复版本</div>
						<div class="newmain2"><span id="source_server">DB2-DBInst1-Sample-2017-10-10 11:30:20</span></div>
					</div>
				</div>  
				<div>
					<div class="newmain">
						<div class="newmain1">目标环境</div>
						<div class="newmain2"><span id="source_time">10.0.20.10</span></div>
					</div>
				</div>
			</div>
			<div title="配置信息" style="padding:10px">
				<div class="container-fluid" style="margin-top:10px;">
					<div id="source_panel" class="easyui-panel" title="备份源" style="width:100%;height:210px;padding:10px;">
						<div>
							<div class="newmain">
								<div class="newmain1">备份版本时间点</div>
								<div class="newmain2"><span id="source_time">2018-11-23 12:23:30</span></div>
							</div>
							<div class="newmain">
								<div class="newmain1">备份服务器</div>
								<div class="newmain2"><span id="source_server">192.168.80.154</span></div>
							</div>
						</div>
						<div>
							<div class="newmain">
								<div class="newmain1">备份节点名</div>
								<div class="newmain2"><span id="source_nodename">nodename</span></div>
							</div>
							<div class="newmain">
								<div class="newmain1">实例名</div>
								<div class="newmain2"><span id="source_instname">ahlm</span></div>
							</div>
						</div>
						<div>
							<div class="newmain">
								<div class="newmain1">数据库名</div>
								<div class="newmain2"><span id="source_dbname">dbname</span></div>
							</div>
							<div class="newmain">
								<div class="newmain1">数据路径</div>
								<div class="newmain2"><span id="source_dbpath">/dbpath</span></div>
							</div>
						</div>
						<div style="width:90%;margin:0 auto;margin-top:50px;">
							<table class="easyui-datagrid" id="source_table" style="width:100%;height:80px;">
								<thead>
					                <tr>
					                    <th data-options="field:'source_dbname',width:'26%'">表空间名</th>
					                    <th data-options="field:'source_dbtype',width:'25.5%'">表空间类型</th>
					                    <th data-options="field:'source_path',width:'25%'">容器路径</th>
					                    <th data-options="field:'source_size',width:'25%'">容器大小</th>
					                </tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<div class="container-fluid" style="margin-top:10px;">
					<div id="target_panel" class="easyui-panel" title="目标环境" style="width:100%;height:210px;padding:10px;">
						<div>
							<div class="newmain">
								<div class="newmain1">IP地址</div>
								<div class="newmain2"><span id="target_ip">192.168.80.154</span></div>
							</div>
							<div class="newmain"></div>
						</div>
						<div>
							<div class="newmain">
								<div class="newmain1">实例名</div>
								<div class="newmain2"><span id="target_instname">instname</span></div>
							</div>
							<div class="newmain">
								<div class="newmain1">数据库名</div>
								<div class="newmain2"><span id="target_dbname">ahlm</span></div>
							</div>
						</div>
						<div>
							<div class="newmain">
								<div class="newmain1">数据路径</div>
								<div class="newmain2"><span id="target_dbpath">/dbname</span></div>
							</div>
							<div class="newmain">
								<div class="newmain1">前滚日志路径</div>
								<div class="newmain2"><span id="target_logpath">/dbpath</span></div>
							</div>
						</div>
						<div style="width:90%;margin:0 auto;margin-top:50px;">
							<table class="easyui-datagrid" id="target_table" style="width:100%;height:80px;">
								<thead>
					                <tr>
					                    <th data-options="field:'target_dbname',width:'26%'">表空间名</th>
					                    <th data-options="field:'target_dbtype',width:'25.5%'">表空间类型</th>
					                    <th data-options="field:'target_path',width:'25%'">容器路径</th>
					                    <th data-options="field:'target_size',width:'25%'">容器大小</th>
					                </tr>
								</thead>
							</table>
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
</html>
