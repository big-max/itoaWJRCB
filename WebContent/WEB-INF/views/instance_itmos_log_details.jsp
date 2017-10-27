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
.bcg {
	background: #00ec00;
}

.bcr {
	background: #ff8080;
}

.bcb {
	background: #8080ff;
}

.bcy {
	background: yellow;
}

.input200 {
	display: inline-block;
	width: 200px;
	margin-top: 2px;
	text-align: right;
}
#logTable3 tr {
	height: 25px;
}
body,ul li,.graytxt,.input140,span,.mr20{ 
	font-size:13px; 
}
.content {
	position:relative;
	float:right;
	width:calc(100% - 57px);
	margin:0px;
	height:calc(100vh - 70px);
	overflow-y:scroll;
}
.inputb28{
	width:27.9%;display:inline-block;
}
.inputb29{
	width:29%;display:inline-block;
}
.inputb30{
	width:30.4%;display:inline-block;
}
.one{
	display:none;
}
.wh{
	width:225px;line-height:8px;float:right;display:none;
}
.sweet-alert button.cancel { 
	background-color: #ec6c62; 
}
.sweet-alert button.cancel:hover { 
	background-color: rgb(229,97,88); 
}
.current1,.current1:hover {
    color: #444444;
}
</style>

<script type="text/javascript">
	$(document).ready(function() 
	{
		giveTdColor1();//主要用于手动页面刷新
		$("#logTable3 tbody").on("click", "tr td", function () 
		{
			var uuid = $("#uuid").val().trim();
			selectedRecord = $(this).html().trim();
			if(selectedRecord=='失败')
			{
			$.ajax({
				url : '<%=path%>/getErrMsg.do?playbook_uuid='+uuid,
				type : 'get',
				dataType : "json",
				error : function(err) {
					//alert(err['errmsg'])
				},
				success:function(data)
				{
					ymPrompt.win({
						width: 500, //宽 
						height: 250, //高 
						message : data['errmsg'],
						title : '错误提示！',
						dragOut:true,
						maxBtn:true,
						handler : function(tp) {},
						btn : [ [ '关闭', 'yes' ]]
					});
				}
			})
		}
		});	
	});
</script>

<script type="text/javascript">
function giveTdColor1()
{
	//给td添加颜色
	trObject = $("#logTable3 tbody").find("tr");
	for (var i = 0; i < trObject.length; i++) 
	{
		var tdText = $(trObject[i]).find("td:last");
		if (tdText.html().trim() == "成功") 
		{
			tdText.removeClass();
			tdText.addClass("bcg");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-success ine-block w100");	
		}
		if (tdText.html().trim() == "失败") 
		{
			tdText.removeClass();
			tdText.addClass("bcr");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-danger ine-block w100");
		}
		if (tdText.html().trim() == "运行中") 
		{
			tdText.removeClass();
			tdText.addClass("bcb");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-primary ine-block w100 active");
		}
		if (tdText.html().trim() == "跳过")  
		{
			tdText.removeClass();
			tdText.addClass("bcy");
		}
	}
}

//ajax 更新每个task的状态信息
function giveTdColor(data)
{
	//给td添加颜色
	$('#logTable3 tbody tr').each(function()
	{
	    var tdText=	$(this).find("td:last");
	    var tdStep = $(this).find("td:first");
	    var tdStep_next  = $(this).find('td:first').find("input");
		tdText.text(data[tdStep_next.val()]);
	   // var tdStep_next=$(this).find('td:first').next();
		//tdText.text(data[tdStep.html().trim()+tdStep_next.html().trim()]);
		if (tdText.html().trim() == "成功") 
		{
			tdText.removeClass();
			tdText.addClass("bcg");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-success ine-block w100");				
		}
		if (tdText.html().trim() == "失败") 
		{
			tdText.removeClass();
			tdText.addClass("bcr");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-danger ine-block w100");
		}
		if (tdText.html().trim() == "运行中") 
		{
			tdText.removeClass();
			tdText.addClass("bcb");
			$("#progress_my").attr("class","progress progress-s progress-striped progress-primary ine-block w100 active");
		}			
		if (tdText.html().trim() == "跳过")  
		{
			$(this).remove();//删除跳过的行
			tdText.removeClass();
			tdText.addClass("bcy");
		}
	})
}


function getInstallMsg() 
{
	var uuid = $("#uuid").val().trim();
//	var type1 = $("#type").val().trim();
	var type1="itm-os";
	$.ajax({
		url : '<%=path%>/nodeInstall.do',
		type : 'post',
		data : { uuid:uuid,type:type1 },
		dataType : "json",
		error : function(err) {
			//alert("获取安装信息异常！");
		},
		success : function(data) 
		{
			giveTdColor(data);//给TD上颜色
			$("#progress_my").prev().html("主机安装进度 :&nbsp;&nbsp;&nbsp;" + data.percent);//安装进度
			$(".bar").attr('style', 'width: ' + data.percent + ';') //percent
			$("#percent").val(data.percent);
			$("#status").val(data.status);
		}
	});
}

function myrefresh() 
{
	if (($("#logmsg").attr("class") == 'tabcontent tabnow'))
	{
		if($("#status").val().trim() != 2 && $("#status").val().trim() != 3)
		{
			getInstallMsg();
		}
	}
}

window.setInterval('myrefresh()',10000);  //每隔10秒自动刷新一次
</script>
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
			<a href="getLogInfo.do"  class="current1" style="position:relative;top:-3px;"><i class="icon-home"></i>历史执行日志</a> 
			<a href="#" class="current" style="position:relative;top:-3px;">任务信息 ITM-OS</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="tabtitle">
							<ul class="tabnav">
								<li>主机节点</li>
								<li>环境参数</li>
								<li class="active">执行日志</li>
							</ul>
						</div>

						<div class="tabcontent ">
								<div class="mainmodule">									
									<h5 class="stairtit swapcon">
										拓扑结构
									</h5>
									<c:forEach items="${servers }" var="ser" varStatus="num">
										<p class="twotit" style="padding-left:0;">
											节点 <c:out value="${num.count }" />																													
										</p>
										<div class="column">
											<div class="span12">
												<p>
													<b>主机名:</b> <span class="column_txt"> ${ser.name }</span>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
													<b>IP地址:</b><span class="column_txt">${ser.ip}</span>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<b>操作系统:</b><span class="column_txt"><em>${ser.os}</em></span>
												</p>
												<p>
													<b>系统配置:</b><span class="column_txt">${ser.hconf }</span> 
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<b>状态:</b><span class="column_txt"><em>${ser.status }</em></span>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
						</div>

						<div class="tabcontent">
								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>基本信息
									</h5>
									<div class="form-horizontal">		
										<div class="control-group">
											<label class="control-label">产品类型</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${itm_type }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">软件版本</span> 
													<span class="graytxt">${itm_version }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">产品代码</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${itm_code }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">补丁版本</span> 
													<span class="graytxt">${itm_fix }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">管理用户</label>
											<div class="controls">
												<div class="inputb2l" >
												    <span class="graytxt">${itm_manager_user }</span> 
												</div>										
												<div class="inputb2l">
													<span class="input140 mr20">部署路径</span> 
													<span class="graytxt">${itm_inst_path }</span> 
												</div>
											</div>
										</div>	
										<div class="control-group">
											<label class="control-label">管理用户属组</label>
											<div class="controls">
												<div class="inputb2l" >
												    <span class="graytxt">${itm_manager_group }</span> 
												</div>										
											</div>
										</div>					
									</div>
								</div>

							<div class="mainmodule">
								<h5 class="swapcon">
									<i class="icon-chevron-down icon-chevron-right"></i>配置信息
								</h5>
								<div class="form-horizontal" >
									<div class="control-group">
										<label class="control-label">是否主备TEMS</label>
										<div class="controls">
											<div class="inputb2l">
												<span class="graytxt">${itm_ha_tems }</span>
											</div>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">主TEMS IP</label>
										<div class="controls ">
											<div class="inputb28">
												<span class="graytxt">${itm_primary_hostname }</span>
											</div>	
											<div class="inputb30">
												<span class="mr20 ">网络协议</span> 
												<span class="graytxt">${itm_primary_protocol }</span>
											</div>									
											<div class="inputb29">
												<span class="mr20 ">连接端口</span> 
												<span class="graytxt">${itm_primary_port }</span>
											</div>
										</div>
									</div>
								
								<c:if test="${itm_ha_tems eq 'yes' }">	
									<div class="control-group">
											<label class="control-label">备TEMS IP</label>
											<div class="controls ">
												<div class="inputb28">
													<span class="graytxt">${itm_secondary_hostname }</span>
												</div>	
												<div class="inputb30">
													<span class="mr20 ">网络协议</span> 
													<span class="graytxt">${itm_secondary_protocol }</span>
												</div>									
												<div class="inputb29">
													<span class="mr20 ">连接端口</span> 
													<span class="graytxt">${itm_secondary_port }</span>
												</div>
											</div>
										</div>
								</c:if>	
								
							 <c:forEach items="${allosbservers }" var="sers">
								 <div class="control-group">
										<label class="control-label">主机名</label>
										<div class="controls ">
											<div class="inputb29">
												<span class="graytxt">${sers.name }</span>
											</div>	
											<div class="inputb29">
												<span class="mr20 ">IP地址</span> 
												<span class="graytxt">${sers.ip }</span>
											</div>									
											<div class="inputb29">
												<span class="mr20 ">TEPS名称</span> 
												<span class="graytxt">${sers.tepsname }</span>
											</div>
										</div>
									</div>
							  </c:forEach>	 																													
								</div>
							</div>
						</div>
						
						<input type="hidden" id="type" name="type" value="${type }">
						<input type="hidden" id="uuid" name="uuid" value="${uuid }">
						<input type="hidden" id="percent" value="${percent}"> 
						<input type="hidden" id="status" value="${status}">
						<div id="logmsg" class="tabcontent tabnow">
							<p class="columntxt2">主机安装进度 :&nbsp;&nbsp;&nbsp;${percent }</p>
							<div id="progress_my"
								class="progress progress-s progress-striped progress-success ine-block w100">
								<div class="bar" name="progress" style="width: ${percent};"></div>
							</div>
							<h5>详细任务执行状态：</h5>
							<table id="logTable3" class="table table-bordered  table-hover table-condensed no-search no-select" style="line-height: 20px">
								<thead>
									<tr>
									<th style="text-align:left;display: none;">序号</th> 
										<th style="text-align: left;">IP地址</th>
										<th style="text-align: left;">操作步骤</th>
										<th style="text-align: center;">状态</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${allServerStatus }" var="ser">
									<c:if test="${ser.status != '跳过' }">
										<tr>
										<td style="display:none;"><input type="hidden" value="${ser.uuid }"/></td>
											<td>${ser.host }</td>
											<td>${ser.name }</td>
											<td style="text-align: center;">${ser.status}</td>
										</tr>
										</c:if>
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
</html>
