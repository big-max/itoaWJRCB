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
<jsp:include page="../header_easyui2.jsp" flush="true" />
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
.newmain{width:40%;height:25px;float:left;}
.newmain1{width:30%;height:25px;line-height:25px;text-align:right;float:left;}
.newmain2{width:65%;height:25px;line-height:25px;float:right;}
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
			<a class="current" style="position:relative;top:-3px;">确认任务</a>
		</div>
		
		<div class="container-fluid">
			<div class="widget-title">
				<a data-toggle="collapse" href="#collapseOne">
					<span class="icon"> <i class="icon-arrow-right"></i></span>
					<h5>步骤3：自动化备份恢复 -> 确认任务</h5>
				</a>
			</div>
		</div>
		
		<div class="container-fluid" style="margin-top:10px;">
			<div id="source_panel" class="easyui-panel" title="备份源" style="width:100%;height:200px;padding:10px;">
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
			<div id="target_panel" class="easyui-panel" title="目标环境" style="width:100%;height:200px;padding:10px;">
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
	<!--content end-->
	
	<!--footer start-->
	<div class="columnfoot" style="width: 93%; left: 5%;">
		<a class="btn btn-info btn-up" onclick="javascript:history.go(-1);">
       		<i class="icon-btn-up"></i><span>上一页</span>
    	</a>
		<a class="btn btn-info fr btn-down" onclick="Submit();">
			<span>提交</span> <i class="icon-btn-next"></i>
		</a>
	</div>
	<!--footer start-->
</body>

<script>
	//下一步
	function Submit()
	{
		window.location.href = "toTargetEnv.do";
	}
</script>
</html>
