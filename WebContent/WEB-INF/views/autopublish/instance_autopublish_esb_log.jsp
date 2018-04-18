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
			<i class="icon-home"></i>自动化发布 ESB日志信息</a>
		</div>
		
		<div class="easyui-layout" style="width:99.8%;height:95%;margin:0 auto;">
			<div data-options="region:'west'" title="参数信息" style="width:30%;padding:10px">
				<div class="divbott" style="height:20px;">
					<div class="inptext">
						<label>发布时间 :&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div style="padding-top:2px;">
						<label id="esb_time"></label>
					</div>
				</div>
				<div class="divbott" style="height:20px;">
					<div class="inptext">
						<label>发布类型 :&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div style="padding-top:2px;">
						<label id="esb_type"></label>
					</div>
				</div>
				<div class="divbott" style="height:20px;">
					<div class="inptext">
						<label>发布版本 :&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div style="padding-top:2px;">
						<label id="esb_version"></label>
					</div>
				</div>
				<div class="divbott" style="height:auto;">
					<div class="inptext">
						<label>发布节点 :&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div style="padding-top:2px;">
						<label id="esb_nodes"></label>
					</div>
				</div>
				<div class="divbott" style="height:20px;">
					<div class="inptext">
						<label>发布员 :&nbsp;&nbsp;&nbsp;</label>
					</div>
					<div style="padding-top:2px;">
						<label id="esb_publisher"></label>
					</div>
				</div>				
			</div>
			
			<div data-options="region:'center'" title="日志信息">
				<textarea id="real_log" style="width:100%;height:98.6%;resize:none;border:0px;"></textarea>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

</script>
</html>
