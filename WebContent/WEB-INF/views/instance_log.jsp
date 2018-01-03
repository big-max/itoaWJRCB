<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.fasterxml.jackson.databind.*"%>
<%@ page import="com.fasterxml.jackson.databind.node.*"%>
<%@ page import="com.ibm.automation.core.util.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="header.jsp" flush="true" />
<title>自动化运维平台</title>
<style type="text/css">
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
	overflow-y:scroll;
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
			<a href="getLogInfo.do" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i> 部署历史执行记录
			</a>
		</div>
		
		<div class="container-fluid">
			<div class="widget-title">
				<a data-toggle="collapse" href="#collapseOne">
					<span class="icon"> <i class="icon-arrow-right"></i></span>
					<h5>说明：历史任务信息列表.</h5>
				</a>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="widget-box nostyle">
							<table id="myTable"
								class="table table-bordered data-table with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">主节点</th>
										<th style="text-align: center;">副节点</th>
										<th style="text-align: center;">任务</th>
										<th hidden="true" style="text-align: center;">时间参数</th>
										<th style="text-align: center;">时间</th>
										<th style="text-align: center;">结果</th>
										<th style="display: none">任务唯一序号</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										String items = String.valueOf(request.getAttribute("items"));
										ObjectMapper om = new ObjectMapper();
										ArrayNode list = (ArrayNode) om.readTree(items);

										int i = 1;
										for (JsonNode jn : list) {
											ObjectNode node = (ObjectNode) jn;
											String uuid = node.get("uuid").asText();
											String type = node.get("type").asText();
											String mainNodes = "";//= ((ArrayNode) node.get("mainNodes")).toString();
											String subNodes = "";
											ArrayNode anMainnodes = (ArrayNode) node.get("mainNodes");
											ArrayNode anSubnodes = (ArrayNode) node.get("subNodes");
											if (anMainnodes.size() == 0) {
												mainNodes = "-";
											} else {
												for (JsonNode jnNode : anMainnodes) {
													mainNodes += jnNode.asText().toString() + " ";
												}
											}
											if (anSubnodes.size() == 0) {
												subNodes = "-";
											} else {
												for (JsonNode jnNode : anSubnodes) {
													subNodes += jnNode.asText().toString() + " ";
												}
											}
											String created_time = node.get("created_time").asText();
											String created_at = node.get("created_at").asText();
											String status = node.get("status").asText().trim();
									%>
									<tr>
										<td style="text-align: center;"><%=i++%></td>
										<td style="text-align: center;"><%=mainNodes%></td>
										<td style="text-align: center;"><%=subNodes%></td>
										<!-- 原来的值是subNode -->
										<td style="text-align: center;"><%=type%></td>
										<td hidden="true" style="text-align: center;"><%=created_time%></td>
										<td style="text-align: center;"><%=created_at%></td>

										<%
											if ("0".equals(status)) {
										%>
										<td style="text-align: center;">&nbsp;&nbsp;&nbsp; <img
											src="img/icons/common/icon_paused.png"> <b>未执行</b>
										</td>
										<%
											} else if ("1".equals(status)) {
										%>
										<td style="text-align: center;">&nbsp;&nbsp;&nbsp; <img
											src="img/icons/common/icon_resized.gif"> <b>执行中</b>
										</td>
										<%
											} else if ("2".equals(status)) {
										%>
										<td style="text-align: center;"><img src="img/icon_success.png" style="margin-bottom:2px;"> <b>成功</b></td>
										<%
											} else {
										%>
										<td style="text-align: center;"><img src="img/icon_error.png" style="margin-bottom:2px;"> <b>失败</b></td>
										<%
											}
										%>
										<td style="display: none"><%=uuid%></td>
										<td style="text-align: center;"><a
												href="getLogInfoDetail.do?uuid=<%=uuid%>&type=<%=type%>&created_time=<%=created_time %>" style="color:#08c;">详细</a></td>

									</tr>

									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
