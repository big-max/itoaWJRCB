<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="../header.jsp" flush="true" />
<title>自动化运维平台</title> 
<style type="text/css">
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
	overflow-y:hidden;
}
.linkexpre{
	float:left;
	margin-left:25px;
}
i:hover{
	cursor:pointer;
}
</style>
<script>
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut});
	}
</script>
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
			<a href="" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>日终流程
			</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="widget-box nostyle">
							<table id="sel_tab" class="table table-bordered with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th hidden="" style="text-align: center;width:20%;">流程名</th>
										<th style="text-align: center;width:20%;">流程名</th>
										<th style="text-align: center;width:15%;">责任人</th>
										<th style="text-align: center;width:20%;">最近运行时间</th>
										<th style="text-align: center;width:20%;">最近任务状态</th>
										<th style="text-align: center;width:25%;">操作链接</th>
									</tr>
								</thead>
								<tbody class="searchable">
									<tr>
										<td class="dayend_name" style="text-align: center;">日终流程</td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;">
											<div style="margin-left:23%;">
												<div class="linkexpre">
													<i id="daily_play" class="daily_play fa fa-play-circle" style="font-size:26px;color:#0066FF;" title="开始流程"></i>
													<i id="daily_pause" class="daily_pause fa fa-pause-circle" style="font-size:26px;color:#FF7F00;display:none;" title="暂停流程"></i>
												</div>
												<!-- <div class="linkexpre">
													<i id="daily_stop" class="daily_stop fa fa-stop-circle" style="font-size:26px;color:#bebebe;" title="终止流程"></i>
												</div> -->
												<div class="linkexpre" style="padding-top:2px;">
													<i id="daily_running" class="daily_running fa fa-telegram" style="font-size:23px;color:#0066FF;" title="查看当前运行状态"></i>
												</div>
												<div class="linkexpre">
													<i id="daily_history" class="daily_history fa fa-clock-o" style="font-size:26px;color:#D4237A;" title="查看历史"></i>
												</div>
											</div>
										</td>
									</tr>
									<!-- <tr>
										<td class="dayend_class" id="dayend_jiexi" hidden="" style="text-align:center;">dayend_jiexi</td>
										<td class="dayend_name" style="text-align: center;">结息流程</td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;">
											<div style="margin-left:23%;">
												<div class="linkexpre">
													<i id="jiexi_play" class="jiexi_play fa fa-play-circle" style="font-size:26px;color:#0066FF;" title="开始流程"></i>
													<i id="jiexi_pause" class="jiexi_pause fa fa-pause-circle" style="font-size:26px;color:#FF7F00;display:none;" title="暂停流程"></i>
												</div>
												<div class="linkexpre">
													<i id="jiexi_stop" class="jiexi_stop fa fa-stop-circle" style="font-size:26px;color:#bebebe;" title="终止流程"></i>
												</div>
												<div class="linkexpre" style="padding-top:2px;">
													<i id="jiexi_running" class="jiexi_running fa fa-telegram" style="font-size:23px;color:#0066FF;" title="查看当前运行状态"></i>
												</div>
												<div class="linkexpre">
													<i id="jiexi_history" class="jiexi_history fa fa-clock-o" style="font-size:26px;color:#D4237A;" title="查看历史"></i>
												</div>
											</div>
										</td>
									</tr> -->	
									<!-- <tr>
										<td class="dayend_class" id="dayend_year" hidden="" style="text-align:center;">dayend_year</td>
										<td class="dayend_name" style="text-align: center;">年终流程</td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;">
											<div style="margin-left:23%;">
												<div class="linkexpre">
													<i id="year_play" class="year_play fa fa-play-circle" style="font-size:26px;color:#0066FF;" title="开始流程"></i>
													<i id="year_pause" class="year_pause fa fa-pause-circle" style="font-size:26px;color:#FF7F00;display:none;" title="暂停流程"></i>
												</div>
												<div class="linkexpre">
													<i id="year_stop" class="year_stop fa fa-stop-circle" style="font-size:26px;color:#bebebe;" title="终止流程"></i>
												</div>
												<div class="linkexpre" style="padding-top:2px;">
													<i id="year_running" class="year_running fa fa-telegram" style="font-size:23px;color:#0066FF;" title="查看当前运行状态"></i>
												</div>
												<div class="linkexpre">
													<i id="year_history" class="year_history fa fa-clock-o" style="font-size:26px;color:#D4237A;" title="查看历史"></i>
												</div>
											</div>
										</td>
									</tr> -->
								</tbody>
							</table>
							
							<!-- 日终事件处理 -->
							<div style="margin-top:20px;"></div>
							<table id="rz_event" class="table table-bordered with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="font-size:13px;" colspan="2">日终事件处理</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${rzEvent }" var="each">
										<tr>
											<td style="text-align: center;width:5%;">${each.num }</td>
											<td>${each.log }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


<script>
	//跳转按钮
	$("#daily_running,#jiexi_running,#year_running").on("click",function(){
		var curr_date = new Date();
		month_str = curr_date.getMonth()+1;
		day_str = curr_date.getDate();
		var current_dag_id = $(this).parents("tr").find(".dayend_class").text(); //获取id
		window.open("dailyRunningPage.do?date_md="+month_str+"-"+day_str);
	})
</script>

</html>