<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../header_easyui.jsp" flush="true" />
<title>自动化运维平台</title>
<style type="text/css">
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
}
.current1,.current1:hover { color: #444444; }
.par1{ width:calc(100% - 57px);height:150px;margin:0 auto; }
.par1_sub{ width:40%;height:150px;float:left; }
.line{ width:100%;height:30px; }
.line1{ width:30%;height:30px;line-height:30px;text-align:right;float:left;font-size:14px; }
.line2{ width:70%;height:30px;line-height:30px;float:left;font-size:14px; }
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
			<a href="getAllServers.do" class="current" style="position:relative;top:-3px;">
			<i class="icon-home"></i>自动化应用发布总览</a>
		</div>
		
		<div class="par1">   
			<div class="par1_sub">
				<div class="line">
					<div class="line1"><b>应用服务器</b></div>
				</div>
				<div class="line">
					<div class="line1">节点：</div>
					<div class="line2" id="app_node">166.3.22.1 , 166.3.22.2 , 166.3.22.3</div>
				</div>
				<div class="line">
					<div class="line1">发布时间：</div>
					<div class="line2" id="app_time">2018-11-12 20:30:00</div>
				</div>
				<div class="line">
					<div class="line1">运行版本：</div>
					<div class="line2" id="app_version">APP.war</div>
				</div>
			</div>
			<div class="par1_sub">
				<div class="line">
					<div class="line1"><b>数据库服务器</b></div>
				</div>
				<div class="line">
					<div class="line1">节点：</div>
					<div class="line2" id="db_node">166.3.22.1 , 166.3.22.2 , 166.3.22.3</div>
				</div>
				<div class="line">
					<div class="line1">发布时间：</div>
					<div class="line2" id="db_time">2018-11-12 20:30:00</div>
				</div>
				<div class="line">
					<div class="line1">运行版本：</div>
					<div class="line2" id="db_version">smartdb.sh</div>
				</div>
			</div>
		</div>
		
		<!-- 表格 -->
		<div style="width:95%;margin:0 auto;">
			<div id="toolbar" style="margin-bottom:5px;margin-top:5px;">
				<button class="easyui-linkbutton" iconCls="icon-redo" onclick="publish()">发布</button>
				<button class="easyui-linkbutton" iconCls="icon-back" onclick="backroll()">回滚</button>
			</div>
			<table class="easyui-datagrid" id="total_table" title="" style="width:100%;height:auto;">
				<thead>
	                <tr>
	                    <th data-options="field:'total_id',width:'1%',checkbox:true">选择</th>
	                    <th data-options="field:'total_ywtype',width:'15%'">发布时间</th>
	                    <th data-options="field:'total_baktype',width:'20%'">发布类型</th>
	                    <th data-options="field:'total_target',width:'21.3%'">发布节点</th>
	                    <th data-options="field:'total_version',width:'15%'">发布员</th>
	                    <th data-options="field:'total_ip',width:'14%'">发布状态</th>
	                    <th data-options="field:'total_ip',width:'15%'">日志</th>
	                </tr>
				</thead>
				<tbody>
					<tr>
	                    <td></td>
	                    <td>1</td>
	                    <td>1</td>
	                    <td>1</td>
	                    <td>1</td>
	                    <td>1</td>
	                    <td>1</td>
	                </tr>
				</tbody>
			</table>
		</div>
	</div>
</body>

<script>
	function publish()
	{
		window.location.href = "toStepSelect.do";
	}
	
	function backroll()
	{
		window.location.href = "toStepChange.do";
	}
</script>
</html>
