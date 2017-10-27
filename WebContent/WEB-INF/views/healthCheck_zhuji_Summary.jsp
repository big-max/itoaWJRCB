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
<jsp:include page="header.jsp" flush="true" />
<title>自动化运维平台</title>
<style>
body,ul li { 
	font-size: 13px; 
}
.trBottomCol{
	border-bottom:1px solid #dfdfe4;
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
</style>
</head>

<body>
	<!--header start-->
	<div class="header">
		<jsp:include page="topleft_close.jsp" flush="true" />
	</div>
	<!--header end-->

	<!--content start-->
	<div class="content">
		<div class="breadcrumb">
			<a href="healthCheck.do" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>实例一览
			</a>
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM 健康检查</a>
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
							<div class="widget-content">健康检查详细信息.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 下载按钮 -->
		<div style="margin-top: 8px;float: left;">
			<span style="margin-right: 15px;"></span>
			<button onclick="downloadInfo('');" class="btn btn-sm" style="background-color: rgb(68, 143, 200);">
				<font color="white">下载详细巡检资料</font>
			</button>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
				  <div class="columnauto">
				    <div class="tabtitle">
						<ul class="tabnav">
							<li class="active">巡检报告</li>
						</ul>
					</div>
					
				 	<div class="tabcontent tabnow">
					    <div style="background-color:rgb(243,243,243);height:33px;line-height:33px;font-size:13px;">
					    	<strong>&nbsp;&nbsp;基础类信息</strong>
					    </div>
						<table style="line-height:23px;font-size:12px;">
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;系统基本情况</td>
								<td>ACRMA IBM</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;微码</td>
								<td>Platform Firmware level: AM770_110</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;AIX版本</td>
								<td>6100-08-04-1341</td>
							</tr>
						</table> 
						
						<div style="margin-top: 20px;margin-bottom: 5px;"></div>
						<div style="background-color:rgb(243,243,243);height:33px;line-height:33px;font-size:13px;">
					    	<strong>&nbsp;&nbsp;硬件类信息</strong>
					    </div>
						<table style="line-height:23px;font-size:12px;">
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;是否存在硬件报错</td>
								<td>否</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;磁盘链路lspath是否正常</td>
								<td>是</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;文件系统使用率是否正常（<75%）</td>
								<td>是</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;内存交换使用率是否正常（<70%）</td>
								<td>是</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;rootvg是否镜像</td>
								<td>否</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;是否有stale逻辑卷</td>
								<td>是</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;启动列表</td>
								<td></td>
							</tr>
						</table>
						
						<div style="margin-top: 20px;margin-bottom: 5px;"></div>
						<div style="background-color:rgb(243,243,243);height:33px;line-height:33px;font-size:13px;">
					    	<strong>&nbsp;&nbsp;HACMP类信息</strong>
					    </div>
						<table style="line-height:23px;font-size:12px;">
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;HA软件版本</td>
								<td>6.1.0.10</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;rsct版本</td>
								<td>3.1.2.1</td>
							</tr>
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;HA节点状态</td>
								<td>正常</td>
							</tr>							
						</table>
						
						<div style="margin-top: 20px;margin-bottom: 5px;"></div>
						<div style="background-color:rgb(243,243,243);height:33px;line-height:33px;font-size:13px;">
					    	<strong>&nbsp;&nbsp;其他类信息</strong>
					    </div>
						<table style="line-height:23px;font-size:12px;">
							<tr>
								<td style="width:250px;">&nbsp;&nbsp;powermt display</td>
								<td></td>
							</tr>							
						</table>
					</div>
					
					
				  </div>
				</div>
			</div>
		</div>
		<div>
		
		</div>
	</div>

</body>
</html>
