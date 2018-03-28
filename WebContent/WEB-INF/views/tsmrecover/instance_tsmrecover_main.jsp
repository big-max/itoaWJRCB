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
			<a class="current" style="position:relative;top:-3px;">一键恢复</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box collapsible">
						<div class="widget-title">
							<a data-toggle="collapse" href="#collapseOne">
								<span class="icon"> <i class="icon-arrow-right"></i></span>
								<h5>说明：</h5>
							</a>
						</div>
						<div id="collapseOne" class="collapse in">
							<div class="widget-content">自动化备份恢复一览表.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div style="width: 100%; height: 85vh;">
			<!-- <div id="toolbar" style="margin-bottom:5px;margin-top:5px;">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addTel()">添加</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editTel()">修改</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="delTel()">删除</a>
			</div> -->
			
			<table class="easyui-datagrid" id="total_table" title="自动化备份恢复" style="width: 100%;height:95%;">
				<thead>
	                <tr>
	                    <th data-options="field:'id',width:80,checkbox:true">序号</th>
	                    <th data-options="field:'type',width:'21%'">类型</th>
	                    <th data-options="field:'ip',width:'23%'">IP</th>
	                    <th data-options="field:'target',width:'25%'">备份对象</th>
	                    <th data-options="field:'version',width:'30%'">数据库版本</th>
	                </tr>
				</thead>
			</table>
		</div>
	
	</div>

</body>

<script>

</script>
</html>
