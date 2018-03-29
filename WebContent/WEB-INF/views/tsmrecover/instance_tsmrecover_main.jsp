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
		
		<div class="container-fluid" style="height:56vh;">
			<div id="toolbar" style="margin-bottom:5px;margin-top:5px;">
				<button class="easyui-linkbutton" iconCls="icon-edit" onclick="openWin()">备份服务器</button>
			</div>
			
			<table class="easyui-datagrid" id="total_table" title="自动化备份恢复" style="width: 100%;height:95%;">
				<thead>
	                <tr>
	                    <th data-options="field:'total_id',width:'1%',checkbox:true">序号</th>
	                    <th data-options="field:'total_ywtype',width:'19%'">业务类型</th>
	                    <th data-options="field:'total_baktype',width:'20%'">备份类型</th>
	                    <th data-options="field:'total_target',width:'20%'">备份对象</th>
	                    <th data-options="field:'total_version',width:'20%'">数据库版本</th>
	                    <th data-options="field:'total_ip',width:'20%'">IP</th>
	                </tr>
				</thead>
			</table>
		</div>
	</div>
	<!--content end-->
	
	<!--footer start-->
	<div class="columnfoot" style="width: 93%; left: 5%;">
		<a class="btn btn-info fr btn-down" onclick="CheckRecover();">
			<span>一键恢复</span> <i class="icon-btn-next"></i>
		</a>
	</div>
	<!--footer start-->
	
	
	
	<!-- 备份服务器弹出框 -->
	<div id="backServer" class="easyui-window" title="管理TSM服务" style="width:70%;height:400px;padding:10px;"
			data-options="closed:true,modal:true,minimizable:false,maximizable:false">
		<div style="margin-bottom:10px;">
			<button class="easyui-linkbutton" iconCls="icon-add" onclick="addServer()">添加服务器</button>
			<button class="easyui-linkbutton" iconCls="icon-cut" onclick="delServer()">删除服务器</button>
		</div>
		<table class="easyui-datagrid" id="bakser_table" style="width: 100%;height:300px;">
			<thead>
                <tr>
                    <th data-options="field:'bakser_id',width:'1%',checkbox:true">选择</th>
                    <th data-options="field:'bakser_type',width:'15%'">Server类型</th>
                    <th data-options="field:'bakser_ip',width:'18%'">IP</th>
                    <th data-options="field:'bakser_version',width:'15%'">版本</th>
                    <th data-options="field:'bakser_synctime',width:'20%'">上次同步时间</th>
                    <th data-options="field:'bakser_syncway',width:'16%'">上次同步方式</th>
                    <th data-options="field:'bakser_op',width:'15%'">管理操作</th>
                </tr>
			</thead>
		</table>
	</div>
	
	<!-- 添加服务器弹出框 -->
 	<div id="addServer" class="easyui-window" title="添加服务器" style="width:30%;height:250px;padding:10px;"
			data-options="modal:true,closed:true,minimizable:false,maximizable:false"> 
		<form id="addServer_form" method="post">
			<div class="addSerMain">
				<div class="addSerSub1">Server类型&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_type" style="width:100%" data-options="required:true">
				</div>
			</div>
			<div class="addSerMain">
				<div class="addSerSub1">IP&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_ip" style="width:100%" data-options="required:true">
				</div>
			</div>
			<div class="addSerMain">
				<div class="addSerSub1">版本&nbsp;：</div>
				<div class="addSerSub2">
					<input class="easyui-textbox" name="addServer_version" style="width:100%" data-options="required:true">
				</div>
			</div>
		</form>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
		</div>
	</div>
</body>

<script>
	//点击“备份服务器”，弹出框 
	function openWin()
	{
		$('#backServer').window('open');
		$("#bakser_table").datagrid();//初始化表格
	}
	
	//点击“备份服务器弹出框”的“添加服务器”按钮 
	function addServer()
	{
		$('#addServer').window('open');
	}
	
	//“添加服务器”提交按钮
	function submitForm()
	{
		$('#addServer_form').form('submit');
	}
	
	//“一键恢复”按钮
	function CheckRecover()
	{
		window.location.href = "BackRecover.do";
	}
</script>
</html>
