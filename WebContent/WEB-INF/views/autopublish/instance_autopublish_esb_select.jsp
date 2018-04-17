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
.textbox-label { width:120px; }
.divbott { margin-bottom:20px; }
.inptext { float:left;width:120px;text-align:right;margin-top:2px; }
.inptext1 { float:left;width:120px;text-align:left;margin-top:2px; }
.checkstyle{ float:left;width:80px;height:27px;line-height:27px; }
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
			<i class="icon-home"></i>自动化发布 ESB</a>
		</div>
		
		<div class="easyui-layout" style="width:99.8%;height:95%;margin:0 auto;">
			<div data-options="region:'west'" title="步骤1：应用信息" style="width:30%;padding:10px">
				<!-- <div class="divbott">
					<div class="inptext">
						<label>变更系统&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="esb_os" name="esb_os" value="" readonly style="width:60%;height:30px;">
					</div>
				</div> -->
				<form id="submits" action="postFormElement.do" enctype="multipart/form-data" method="post">
				<div class="divbott" style="height:20px;">
					<div class="inptext">
						<label>变更类型&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<div style="float:left;width:20px;">
							<input id="app_checkbox" type="checkbox" name="esb_type" value="0" />
						</div>
						<div class="checkstyle">应用程序</div>
						<div style="float:left;width:20px;">
							<input id="db_checkbox" type="checkbox" name="esb_type" value="1" />
						</div>
						<div class="checkstyle">数据库</div>
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>应用发布包&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input  name="esb_appfile" class="easyui-filebox" id="esb_appwar" data-options="prompt:'选择文件'" style="width:220px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>应用服务器&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<select class="easyui-combobox" id="esb_appserver" name="esb_appserver" style="width:220px;" multiple readonly>
							<option value="10.1.120.10" selected="selected">10.1.120.10</option>
							<option value="10.1.120.11">10.1.120.11</option>
						</select>
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>数据库发布包&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input  name="esb_dbfile" class="easyui-filebox" id="esb_db" data-options="prompt:'选择文件'" style="width:220px;" >
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>数据库服务器&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<select class="easyui-combobox" id="esb_dbserver" name="esb_dbserver" style="width:220px;" multiple readonly>
							<option value="10.1.120.10" selected="selected">10.1.120.10</option>
							<option value="10.1.120.11">10.1.120.11</option>
						</select>
					</div>
				</div>
				</form>
				<div style="margin:0 auto;margin-top:60px;width:80%;">
					<a id="retry" href="javascript:void(0)" class="easyui-linkbutton" style="padding:5px 0px;width:100%;">
						<span style="font-size:14px;">提交</span>
					</a>
				</div>
				<div style="margin:0 auto;margin-top:60px;width:80%;">
					<a id="rollback" href="javascript:void(0)" class="easyui-linkbutton" style="padding:5px 0px;width:100%;">
						<span style="font-size:14px;">回滚</span>
					</a>
				</div>
			</div>
			
			<div data-options="region:'center'" title="实时日志">
				<textarea id="real_log" style="width:100%;height:98.6%;resize:none;border:0px;"></textarea>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		$("#retry").click(function(){
			//陈芙蓉写  判断 checkbox 必须至少选择一个
			
			$("#submits").submit();
			//window.location.href = "toStepSubmit.do";
		})
	})
	
	$(document).ready(function(){		
		$("#app_checkbox").click(function(){
			var flag1 = $("#app_checkbox").is(":checked");
			if(flag1 == true){
				$("#esb_appwar").combobox("readonly",false);
				$("#esb_appserver").combobox("readonly", false);
			}
			else{
				$("#esb_appwar").combobox("readonly");
				$("#esb_appserver").combobox("readonly", true);
			}
		})
		$("#db_checkbox").click(function(){
			var flag2 = $("#db_checkbox").is(":checked");
			if(flag2 == true){
				$("#esb_db").combobox("readonly",false);
				$("#esb_dbserver").combobox("readonly", false);
			}
			else{
				$("#esb_db").combobox("readonly");
				$("#esb_dbserver").combobox("readonly", true);
			}
		})
	})
</script>
</html>
