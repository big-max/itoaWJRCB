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
			<div data-options="region:'west'" title="基本信息" style="width:30%;padding:10px">
				<div class="divbott">
					<div class="inptext">
						<label>变更系统&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="esb_os" name="esb_os" value="" readonly style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>变更类型&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="esb_type" name="esb_type" value="" readonly style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>变更版本&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="esb_version" name="esb_version" value="" readonly style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>变更时间&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input class="easyui-textbox" id="esb_time" name="esb_time" value="" readonly style="width:60%;height:30px;">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>变更目标&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div>
						<input id="esb_target" name="esb_target" style="width:60%;" class="easyui-combobox" multiple="multiple"
							data-options="valueField: 'esb_target',textField: 'esb_target',editable:false">
					</div>
				</div>
				
				<div class="divbott">
					<div class="inptext">
						<label>变更状态&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div class="inptext1">
						<span id="esb_status" style="font-size:13px;"></span>
					</div>
				</div>
				
				<div style="margin-top:60px;">
					<div style="float:left;width:38%;margin-left:50px;">
						<a id="retry" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="padding:5px 0px;width:100%;">
							<span style="font-size:14px;">重试</span>
						</a>
					</div>
					<div style="float:right;width:38%;margin-right:20px;">
						<a id="back" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" style="padding:5px 0px;width:100%;">
							<span style="font-size:14px;">回滚</span>
						</a>
					</div>
				</div>
				
			</div>
			
			<div data-options="region:'center'" title="实时日志">
				<textarea id="real_log" style="width:100%;height:98.6%;resize:none;border:0px;"></textarea>
			</div>
		</div>
	</div>
</body>
</html>
