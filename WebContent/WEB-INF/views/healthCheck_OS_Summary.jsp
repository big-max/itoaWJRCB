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
							<div class="widget-content">OS健康检查详细信息.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 移除按钮 -->
		<div>
		<div style="margin-top: 8px;float: left;">
			<span style="margin-right: 15px;"></span>
			<button onclick="downloadInfo('os');" class="btn btn-sm" style="background-color: rgb(68, 143, 200);">
				<font color="white">下载OS详细巡检资料</font>
			</button>
		</div>
		
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
				  <div class="columnauto">
				    <div class="tabtitle">
							<ul class="tabnav">
								<li class="active">OS巡检报告</li>
							</ul>
					</div>
					
				 <div class="tabcontent tabnow">
					<div class="mainmodule">
					    <div style="background-color:rgb(243,243,243);height:33px;line-height:33px;font-size:13px;">
					    	<strong>&nbsp;&nbsp;基本信息</strong>
					    </div>
						<table style="line-height:23px;font-size:12px;">
							<tr>
								<td style="width:200px;">&nbsp;&nbsp;主机名</td>
								<td>${OSMap.OSHostname }</td>
							</tr>
							<tr>
								<td style="width:200px;">&nbsp;&nbsp;IP</td>
								<td>${OSMap.OSIP }</td>
							</tr>
							<tr>
								<td style="width:200px;">&nbsp;&nbsp;操作系统版本</td>
								<td>${OSMap.OSVersion }</td>
							</tr>
							<tr>
								<td style="width:200px;">&nbsp;&nbsp;系统运行时间</td>
								<td>${OSMap.OSStart }</td>
							</tr>
						</table> 
						
						<div style="margin-top: 30px;margin-bottom: 5px;"></div>
						<table class="table table-hover" style="line-height:25px;">
							<thead>
								<tr>
									<th>资源使用率</th>
									<th>健康基线</th>
									<th>巡检情况</th>
									<th>健康状态</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="osSystemInfo" items="${ OSSystemInfoList}">
									<c:if test="${ osSystemInfo.healthStatus eq 'GOOD' }">
										<tr style="color: green;">
											<td>${osSystemInfo.healthInfo}</td>
											<td>${osSystemInfo.healthLine}</td>
											<td>${osSystemInfo.healthValue}</td>
											<td>${osSystemInfo.healthStatus}</td>
										</tr>
									</c:if>
									<c:if test="${ osSystemInfo.healthStatus eq 'WARN' }">
										<tr style="color: yellow;">
											<td>${osSystemInfo.healthInfo}</td>
											<td>${osSystemInfo.healthLine}</td>
											<td>${osSystemInfo.healthValue}</td>
											<td>${osSystemInfo.healthStatus}</td>
										</tr>
									</c:if>
									<c:if test="${ osSystemInfo.healthStatus eq 'BAD' }">
										<tr style="color: RED;">
											<td>${osSystemInfo.healthInfo}</td>
											<td>${osSystemInfo.healthLine}</td>
											<td>${osSystemInfo.healthValue}</td>
											<td>${osSystemInfo.healthStatus}</td>
										</tr>
									</c:if>
								
								
								
								</c:forEach>
							</tbody>
						</table>
						
						<div style="margin-top: 30px;margin-bottom: 5px;"></div>
						<div style="background-color:rgb(243,243,243);height:33px;line-height:33px;font-size:13px;">
					    	<strong>&nbsp;&nbsp;系统环境变量</strong>
					    </div>
					   <table style="font-size:12px;">
					   		<c:forEach items="${OSENVList}" var="env">
					   			<tr><td>${ env}</td></tr>
					   		</c:forEach>
					   
					   </table>
					   <div style="margin-top: 30px;margin-bottom: 5px;"></div>
						<table class="table table-hover" style="line-height:25px;">
							<thead>
							<tr>
								<th>CPU使用率TOP10进程</th>
								<th>运行时间（分）</th>
								<th>进程ID</th>
								<th>CPU使用率</th>
								<th>所属用户</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach var="ostop10" items="${OSTop10List }">
									<tr>
										<td>${ ostop10.command}</td>
										<td>${ ostop10.elapese}</td>
										<td>${ ostop10.pid}</td>
										<td>${ ostop10.cpu}</td>
										<td>${ ostop10.user}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div style="margin-top: 30px;margin-bottom: 5px;"></div>
						<div style="background-color:rgb(243,243,243);height:33px;line-height:33px;font-size:13px;">
					    	<strong>&nbsp;&nbsp;Crontab计划任务</strong>
					    </div>
						<table  id="cronjobs" name="cronjobs" style="font-size:12px;">
							<c:forEach var="cronjob"  items="${OSCronjobs }">
								<tr><td style="width:200px;">${cronjob.key}<td style="width:600px;">${cronjob.value}</td></tr>
							</c:forEach>
							
						</table>


					  </div>
					</div>
					
					
				  </div>
				</div>
			</div>
		</div>
		<div>
			<form action="" id="tempForm" name="tempForm">
				<input type="hidden" id="healthJobsRunResult_ip" name="healthJobsRunResult_ip" value=" ${OSMap.OSIP } ">
				<input type="hidden" id="healthJobsRunResult_uuid" name="healthJobsRunResult_uuid" value="${healthJobsRunResult_uuid }">
			</form>
		
		</div>
	</div>
<script type="text/javascript">
		function downloadInfo(pro) {
			var uuid=$("#healthJobsRunResult_uuid").val();
			var ip=$("#healthJobsRunResult_ip").val();
			var form = $("<form>");//定义一个form表单
			form.attr("style", "display:none");
			form.attr("target", "download");
			form.attr("method", "post");
			form.attr("action", "healthCheck_download_summary_info.do");
			var input1 = $("<input>");
			input1.attr("type", "hidden");
			input1.attr("name", "healthJobsRunResult_uuid");
			input1.attr("value", uuid);
			var input2 = $("<input>");
			input2.attr("type", "hidden");
			input2.attr("name", "healthJobsRunResult_ip");
			input2.attr("value", ip);
			var input3 = $("<input>");
			input3.attr("type", "hidden");
			input3.attr("name", "product");
			input3.attr("value", pro);
			$("body").append(form);//将表单放置在web中
			form.append(input1);
			form.append(input2);
			form.append(input3);
			form.submit();//表单提交 

		}
	</script>
</body>
</html>
