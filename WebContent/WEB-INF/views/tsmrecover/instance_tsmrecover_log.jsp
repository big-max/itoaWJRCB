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
	/* overflow-y:scroll; */
}
.current1,.current1:hover {
    color: #444444;
}
.addSerMain{width:100%;height:40px;margin-bottom:10px;}
.addSerSub1{width:22%;height:40px;line-height:35px;float:left;text-align:right;}
.addSerSub2{width:250px;height:40px;line-height:30px;float:left;}
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
			<a class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>TSM 一键恢复历史执行记录
			</a>
		</div>
		
		<div class="container-fluid">
			<div class="widget-title">
				<a data-toggle="collapse" href="#collapseOne">
					<span class="icon"> <i class="icon-arrow-right"></i></span>
					<h5>说明：历史恢复信息列表.</h5>
				</a>
			</div>
		</div>
		
		<div class="container-fluid" style="height:56vh;">
			<div id="toolbar" style="margin-bottom:5px;margin-top:5px;">
				<button class="easyui-linkbutton" iconCls="icon-cut" onclick="detele()">删除</button>
			</div>
			
			<table class="easyui-datagrid" id="total_table" title="自动化备份恢复" style="width: 100%;height:95%;">
				<thead>
	                <tr>
	                    <th data-options="field:'total_id',width:'1%',checkbox:true">序号</th>
	                    <th data-options="field:'total_baktype',width:'20%'">IP</th>
	                    <th data-options="field:'total_target',width:'20%'">时间</th>
	                    <th data-options="field:'total_version',width:'20%'">结果</th>
	                    <th data-options="field:'total_ip',width:'20%'">操作</th>
	                </tr>
				</thead>
				<tbody>
					<tr><!-- 测试用 -->
						<td><input type="checkbox"></td>
						<td>192.168.80.154</td>
						<td>2018-3-21 13:20:20</td>
						<td>进行中</td>
						<td><a href="tsmDetailLog.do" style="color:#08c;">详情</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--content end-->
	
</body>

<script>
	
</script>
</html>
