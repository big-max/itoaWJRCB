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
.newmain{width:40%;height:30px;float:left;}
.newmain1{width:30%;height:30px;line-height:30px;text-align:right;float:left;}
.newmain2{width:65%;height:30px;line-height:28px;float:right;}
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
			<a class="current" style="position:relative;top:-3px;">选择备份源</a>
		</div>
		
		<div class="container-fluid">
			<div class="widget-title">
				<a data-toggle="collapse" href="#collapseOne">
					<span class="icon"> <i class="icon-arrow-right"></i></span>
					<h5>步骤1：自动化备份恢复 -> 选择备份源</h5>
				</a>
			</div>
		</div>
		
		<div class="container-fluid" style="margin-top:10px;">
			<div id="" class="easyui-panel" title="" style="width:100%;height:200px;padding:10px;">
				<div>
					<div class="newmain">
						<div class="newmain1">备份开始时间点</div>
						<div class="newmain2">
							<input class="easyui-datetimebox" name="starttime" data-options="required:true,showSeconds:true" style="width:100%;"> 
						</div>
					</div>
					<div class="newmain">
						<div class="newmain1">备份结束时间点</div>
						<div class="newmain2">
							<input class="easyui-datetimebox" name="endtime" data-options="required:true,showSeconds:true" style="width:100%;"> 
						</div>
					</div>
					<div style="width:15%;height:30px;line-height:30px;float:right;">
						<button class="btn-primary">检索</button>
					</div>
				</div>
				<div style="width:90%;margin:0 auto;margin-top:50px;">
					<table class="easyui-datagrid" id="index_table" style="width:100%;height:120px;">
						<thead>
			                <tr>
			                    <th data-options="field:'index_version',width:'26%'">备份版本</th>
			                    <th data-options="field:'index_server',width:'25.5%'">备份服务器</th>
			                    <th data-options="field:'index_nodename',width:'25%'">备份节点名</th>
			                    <th data-options="field:'index_op',width:'25%'">操作</th>
			                </tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		
		<div class="container-fluid" style="margin-top:10px;">
			<div id="" class="easyui-panel" title="" style="width:100%;height:84px;padding:5px;">
				<div>
					<div class="newmain">
						<div class="newmain1">数据库软件</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="db_software" name="db_software" style="width:100%;" readonly> 
						</div>
					</div>
					<div class="newmain">
						<div class="newmain1">数据库名</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="db_name" name="db_name" style="width:100%;" readonly> 
						</div>
					</div>
				</div>
				<div>
					<div class="newmain" style="margin-top:10px;">
						<div class="newmain1">实例名</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="inst_name" name="inst_name" style="width:100%;" readonly> 
						</div>
					</div>
					<div class="newmain" style="margin-top:10px;">
						<div class="newmain1">数据路径</div>
						<div class="newmain2">
							<input class="easyui-textbox" id="db_path" name="db_path" style="width:100%;" readonly> 
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container-fluid" style="margin-top:10px;">
			<table class="easyui-datagrid" id="bakResource_table" style="width:100%;height:100px;">
				<thead>
	                <tr>
	                    <th data-options="field:'bakser_type',width:'25%'">表空间名</th>
	                    <th data-options="field:'bakser_ip',width:'25%'">表空间类型</th>
	                    <th data-options="field:'bakser_version',width:'26.5%'">容器路径</th>
	                    <th data-options="field:'bakser_synctime',width:'25%'">容器大小</th>
	                </tr>
				</thead>
			</table>
		</div>
	</div>
	<!--content end-->
	
	<!--footer start-->
	<div class="columnfoot" style="width: 93%; left: 5%;">
		<a class="btn btn-info fr btn-down" onclick="Next();">
			<span>下一步</span> <i class="icon-btn-next"></i>
		</a>
	</div>
	<!--footer start-->
</body>

<script>
	//下一步
	function Next()
	{
		window.location.href = "toTargetEnv.do";
	}
</script>
</html>
