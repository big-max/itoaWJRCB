<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
body { 
	font-size: 13px; 
}
.div_cursor{ 
	cursor:pointer; 
}
.table_color { 
	background: rgba(0, 0, 0, 0) linear-gradient(#fdfefe, #f5f9fc) repeat scroll 0 0; 
}
.tooltip { 
	width:110px;word-wrap:break-word; 
}
.label-info{
	background-color:#5bc0de;
}
.label-success{
	background-color:#5cb85c;
}
.label-danger{
	background-color:#d9534f;
}
.scroll{
	overflow-y:scroll;
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
.pic_zhu{
	height:20px;width:30px;border-radius:5px 5px 5px 5px;float:left;margin-right:10px;margin-top:3px;
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
			<a href="getAllsecurityJobs.do" class="current" style="position:relative;top:-3px;"><i class="icon-home"></i>实例一览</a>
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM 安全加固</a>
		</div>

		<div class="container-fluid">
			<div class="row-fluid" style="border: 1px;">
				<div class="span12">
					<div class="mainmodule">
						<div style="width: 50%; float: left;">
							<div style="height: 33px; line-height: 33px; width: 150px;font-size:13px;">
								<strong>&nbsp;&nbsp;${securitySummaryInfo.job_type == 1 ? "加固任务" : "检测任务"}</strong>
							</div>
						</div>
						<div style="width: 50%; float: right;">
							<div style="height: 33px; line-height: 33px; width: 150px;font-size:13px;">
								<strong>&nbsp;&nbsp;任务结果统计</strong>
							</div>
						</div>

						<div style="width: 100%; height: 250px;">
							<table id="sel_tab" class="table table_color" style="line-height: 15px; width: 40%; float: left;">
								<tr>
									<td style="border: 0; width: 150px;">任务执行时间</td>
									<td id="" style="border: 0;"><span>${securitySummaryInfo.exectime }</span></td>
								</tr>
								 <tr>
									<td style="border: 0; width: 150px;">执行对象</td>
									<td id="" style="border: 0;"><span><c:forEach items="${securitySummaryInfo.ip_list }" var="ip" varStatus="status">
												${ip} &nbsp;
											</c:forEach></span></td>
								</tr> 
								<tr>
									<td style="border: 0; width: 150px;">任务提交人</td>
									<td id="" style="border: 0;">${securitySummaryInfo.user }</td>
								</tr>
								<tr>
									<td style="border: 0; width: 150px;">任务执行状态</td>
									<td id="confCompDetail_status" style="border: 0;">
										<c:if test="${securitySummaryInfo.status eq 2 }"><span class="label label-danger">已结束</span></c:if>
										<c:if test="${securitySummaryInfo.status eq 0 }"><span class="label label-info">未开始</span></c:if>
										<c:if test="${securitySummaryInfo.status eq 1 }"><span class="label label-info">运行中</span></c:if>
									</td>
								</tr>
								
							</table>

							<div id="main" style="float: left; width: 50%; height: 200px;"></div>
							
							<!-- 饼图的注解 -->
							<div style="float: right; width: 10%; height: 200px;">
								<div style="height:30px;">
									<div class="pic_zhu" style="background-color:#7BC41D;"></div>
									<font size="2px;">${securitySummaryInfo.job_type == 1 ? "加固成功" : "安全合规"}</font>
								</div>
								<div style="height:30px;">
									<div class="pic_zhu" style="background-color:#F83F03;"></div>
									<font size="2px;">${securitySummaryInfo.job_type == 1 ? "加固失败" : "安全不合规"}</font>
								</div>
							</div>
							<!-- 饼图的注解 -->
						</div>						
					</div>
				 </div>
				</div>
			</div>
						

		<div class="container-fluid">
			<div class="row-fluid" style="border: 1px;">
				<div class="span12">
					<div class="mainmodule">						
						<!-- add some table -->
						<input id="filter" type="text" class="form-control" placeholder="请输入IP查找" style="height:28px;">
		
						<div id="flow" style="height:180px;">
							<table id="iptable" class="table" style="background-color:#F7FAFD;">
								<c:forEach var="ipstatus" items="${ securityIPJobList }" varStatus="status">
									<c:if test="${status.count eq 1 || (status.count-1) % 6 eq 0}">
										<tr>
									</c:if>
									<c:if test="${ipstatus.status eq 0}">
										<td style="border:0;"><a style="color: #F83F03;" href="${ipstatus.summary }">${ipstatus.ip }</a></td>
									</c:if>
									<c:if test="${ipstatus.status eq 1}">
										<td style="border:0;"><a style="color: #7BC41D;" href="${ipstatus.summary }">${ipstatus.ip }</a></td>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>		

		<form id="hiddenForm">
			<input type="hidden" id="correctNum" name="correctNum" value="${securitySummaryInfo.correctnum }">
			<input type="hidden" id="incorrectNum" name="incorrectNum" value="${securitySummaryInfo.incorrectnum }">
			<input type="hidden" id="totalNum" name="totalNum" value="${securitySummaryInfo.totalnum }">
		</form>
	</div>
	<script type="text/javascript">
//产生pie的数据配置
function createData(value,color,name)
{
	var goodData =  new Object();
	var outerData = new Object();
	var innerData = new Object();
	innerData['color']=color;      //颜色
	outerData['normal']=innerData;
	goodData['value']=value;   //具体数值
	goodData['name']=name;   //good  warn error unreachable
	goodData['itemStyle']=outerData;
	return goodData;
}
option = {
		series : [ {
			name : '访问来源',
			type : 'pie',
			radius : '90%',
			data : []
		} ]
	};
	var myChart = echarts.init(document.getElementById('main'));
	
	totalNum = parseInt($("#totalNum").val());
	
	
	 if ( $("#correctNum").val() > 0  )
	{
		num4=$("#correctNum").val();
		rate4 = (parseInt(num4)/totalNum).toFixed(2)*100;
		option['series'][0]['data'].push(createData(parseInt(num4),'#7BC41D','成功('+rate4+'%)'));
	} 
	 if ($("#incorrectNum").val() > 0 )
	{
		num1=$("#incorrectNum").val();
		rate1 = (parseInt(num1)/totalNum).toFixed(2)*100;
		option['series'][0]['data'].push(createData(parseInt(num1),'#F83F03','失败('+rate1+'%)'));
	} 
	myChart.setOption(option); // 使用刚指定的配置项和数据显示图表
</script>
</body>

</html>
