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
			<i class="icon-home"></i>自动化发布 WAS</a>
		</div>
		
		<div class="easyui-layout" style="width:99.8%;height:95%;margin:0 auto;">
			<div data-options="region:'west'" title="基本信息" style="width:30%;padding:10px">
				<div class="divbott">
					<div class="inptext">
						<label>war包路径&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<select id="file_path" name="file_path" class="easyui-combobox" style="width:60%;height:30px;">
							<option value="" selected="selected">/tmp</option>	
						</select>
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>was用户名&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="was_user" name="was_user" value="root" style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>profile路径&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="was_profile_home" name="was_profile_home" value="/opt/IBM/WebSphere/AppServer/profiles/AppSrv02" style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>was控制台用户名&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="was_username" name="was_username" value="" style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>was控制台密码&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="was_password" name="was_password" value="" style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>app名称 &nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="app_name" name="app_name" value="" style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>上下文根 &nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="app_contextroot" name="app_contextroot" value="" style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>发布类型 &nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<select id="deploy_type" name="deploy_type" class="easyui-combobox" style="width:60%;height:30px;">
							<option value="update" selected="selected">update</option>	
							<option value="new">new</option>	
						</select>
					</div>
				</div>
				
				<div class="divbott">
					<a id="startBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:80%;margin-left:50px;;">
						<span style="font-size:14px;">发起</span>
					</a>
				</div>
				
			</div>
			
			<div data-options="region:'center'" title="实时日志">
				<textarea id="real_log" style="width:100%;height:98.6%;resize:none;border:0px;"></textarea>
			</div>
		</div>
	</div>
</body>
</html>
