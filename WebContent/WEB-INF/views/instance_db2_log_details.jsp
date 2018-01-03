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
#logTable3 tr{
	height:25px;
}
body,ul li,.graytxt,.input140,span{
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
.current1,.current1:hover {
    color: #444444;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		giveTdColor1();//主要用于手动页面刷新
		
		//用于获取点击失败、的原因		
		$("#logTable3 tbody").on("click", "tr td", function () {
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
	console.log(data);
	//给td添加颜色
	$('#logTable3 tbody tr').each(function()
	{
	   var tdText=	$(this).find("td:last");
	   var tdStep = $(this).find("td:first");
	   var tdStep_next  = $(this).find('td:first').find("input");
	   tdText.text(data[tdStep_next.val()]);
	  // tdText.text(data[tdStep.html().trim()+tdStep_next.html().trim()]);
	  	
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
	var type = $("#type").val().trim();
	var created_time=$("#created_time").val().trim();
	$.ajax({
		url : '<%=path%>/nodeInstall.do',
		type : 'post',
		data : {
			uuid:uuid,
			type:type,
			created_time:created_time
		},
		error : function(err) {
			//alert("获取安装信息异常！");
		},
		success : function(data) {
			$("#deplylog").html(data);
			/* giveTdColor(data);//给TD上颜色	
			$("#progress_my").prev().html("主机安装进度 :&nbsp;&nbsp;&nbsp;" + data.percent);//安装进度
			$(".bar").attr('style', 'width: ' + data.percent + ';') //percent
			$("#percent").val(data.percent);
			$("#status").val(data.status); */
		}
	});
}

function myrefresh() 
{
	if (($("#logmsg").attr("class") == 'tabcontent tabnow')) 
	{
		getInstallMsg();	
		/* if ($("#status").val().trim() != 2 && $("#status").val().trim() != 3)
		{
			getInstallMsg();			
		} */
	}
}   

window.setInterval('myrefresh()',5000);  //每隔10秒自动刷新一次
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
			<a href="getLogInfo.do" class="current1" style="position:relative;top:-3px;"><i class="icon-home"></i>历史执行日志</a> 
			<a href="#" class="current" style="position:relative;top:-3px;">任务信息</a>
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

						<div class="tabcontent">
								<div class="mainmodule">
									<h5 class="stairtit swapcon">拓扑结构</h5>
									<p class="twotit" style="padding-left: 0px;">
										<em class="majornode">单</em>节点1
									</p>

									<c:forEach items="${servers }" var="ser" varStatus="num">
										<div class="column">
											<div class="span12">
												<p>
													<b>主机名:</b> <span class="column_txt"> ${ser.name } </span>
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
							<c:if test="${platform == 'aix' }">
								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down"></i>系统参数
									</h5>
									<div class="form-horizontal">
										
										<div class="control-group groupborder divnfs">
											<div class="controls controls-mini" style="margin-left: 0.7%;">
												<span class="input140 mr20" style="width: 142px;">VG名称</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${vgdb2home }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">包含PV</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${db2homepv }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">VG创建方式</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${db2homemode }</span>
												</div>
											</div>
										</div>
										<div class="control-group groupborder divnfs">
											<div class="controls controls-mini" style="margin-left: 0.7%;">
												<span class="input140 mr20" style="width: 142px;">VG名称</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${vgdb2log }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">包含PV</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${db2logpv }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">VG创建方式</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${db2logmode }</span>
												</div>
											</div>
										</div>
										<div class="control-group groupborder divnfs">
											<div class="controls controls-mini" style="margin-left: 0.7%;">
												<span class="input140 mr20" style="width: 142px;">VG名称</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${vgdb2archlog }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">包含PV</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${db2archlogpv }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">VG创建方式</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${db2archlogmode }</span>
												</div>
											</div>
										</div>
										<div class="control-group groupborder divnfs">
											<div class="controls controls-mini" style="margin-left: 0.7%;">
												<span class="input140 mr20" style="width: 142px;">VG名称</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${vgdataspace }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">包含PV</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${dataspacepv }</span>
												</div>
												<span class="input140 mr20" style="width: 128px;">VG创建方式</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${dataspacemode }</span>
												</div>
											</div>
										</div>
										
										<c:if test="${nfsON ne ison }">
											<div class="controls controls-mini" style="margin-left: 0.7%;">
												<span class="input140 mr20" style="width: 142px;">是否挂载NFS文件系统</span>
												<div class="inputb4" style="width: 20%;">
													<span class="graytxt">${nfsON }</span>
												</div>
											</div>
										</c:if>

										<%-- <c:if test="${nfsON eq ison }">
											<c:if test="${nfsIP1 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址1</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP1 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录1</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint1 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点1</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint1 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP2 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址2</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP2 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录2</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint2 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点2</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint2 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP3 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址3</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP3 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录3</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint3 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点3</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint3 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP4 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址4</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP4 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录4</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint4 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点4</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint4 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP5 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址5</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP5 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录5</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint5 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点5</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint5 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP6 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址6</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP6 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录6</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint6 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点6</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint6 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP7 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址7</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP7 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录7</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint7 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点7</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint7 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP8 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址8</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP8 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录8</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint8 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点8</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint8 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP9 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址9</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP9 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录9</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint9 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点9</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint9 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP10 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址10</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP10 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录10</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint10 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点10</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint10 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP11 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址11</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP11 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录11</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint11 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点11</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint11 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP12 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址12</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP12 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录12</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint12 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点12</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint12 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP13 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址13</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP13 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录13</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint13 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点13</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint13 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP14 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址14</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP14 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录14</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint14 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点14</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint14 }</span>
													</div>
												</div>
											</c:if>
											<c:if test="${nfsIP15 != '' }">
												<div class="controls controls-mini" style="margin-left: 0.7%;">
													<span class="input140 mr20" style="width: 142px;">NFS服务端IP地址15</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsIP15 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">服务端共享目录15</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsSPoint15 }</span>
													</div>
													<span class="input140 mr20" style="width: 128px;">NFS客户端挂载点15</span>
													<div class="inputb4" style="width: 20%;">
														<span class="graytxt">${nfsCPoint15 }</span>
													</div>
												</div>
											</c:if>
										</c:if> --%>
									</div>
								</div>
							</c:if>
							
								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>基本信息
									</h5>
									<div class="form-horizontal">										
										<div class="control-group">
											<label class="control-label">DB2安装版本</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_version }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">DB2版本补丁</span> 
													<span class="graytxt">${db2fix }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">DB2安装路径</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_db2base }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">DB2实例目录</span> 
													<span class="graytxt">${db2_dbpath }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">DB2实例名</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_db2insusr }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">监听端口</span> 
													<span class="graytxt">${db2_svcename }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">DB2数据库名</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_dbname }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">字符集</span> 
													<span class="graytxt">${db2_codeset }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">DB2数据目录</label>
											<div class="controls">
												<span class="graytxt">${db2_dbdatapath }</span>
											</div>
										</div>
									</div>
								</div>

								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>实例高级属性
									</h5>
									<div class="form-horizontal">
										<div class="control-group">
											<label class="control-label">实例用户</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_db2insusr }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">实例用户组</span> 
													<span class="graytxt">${db2_db2insgrp }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">fence用户</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_db2fenusr }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">fence用户组</span> 
													<span class="graytxt">${db2_db2fengrp }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">DB2COMM</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_db2comm }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">DB2CODEPAGE</span> 
													<span class="graytxt">${db2_db2codepage }</span>
												</div>
											</div>
										</div>																				
									</div>
								</div>

								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>数据库高级属性
									</h5>
									<div class="form-horizontal">
										<div class="control-group">
											<label class="control-label">DB2日志路径</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_db2log }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">归档日志路径</span> 
													<span class="graytxt">${db2_logarchpath }</span>
												</div>
											</div>
										</div>																				
										<div class="control-group">
											<label class="control-label">LOCKTIMEOUT</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_locktimeout }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">LOGFILESIZ</span> 
													<span class="graytxt">${db2_logfilesize } MB</span>
												</div>
											</div>
										</div>																				
										<div class="control-group">
											<label class="control-label">LOGPRIMARY</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_logprimary }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">LOGSECOND</span> 
													<span class="graytxt">${db2_logsecond }</span>
												</div>
											</div>
										</div>																			
										<div class="control-group">
											<label class="control-label">TRACKMOD</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_trackmod }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">PAGESIZE</span> 
													<span class="graytxt">${db2_pagesize }</span>
												</div>
											</div>
										</div>										
										<div class="control-group">
											<label class="control-label">SOFTMAX</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${db2_softmax }</span>
												</div>
											</div>
										</div>
									</div>
								</div>							
						</div>
						
						
						<input type="hidden" id="type" name="type" value="${type }">
						<input type="hidden" id="uuid" name="uuid" value="${uuid }">
						<input type="hidden" id="created_time" name="created_time" value="${created_time }">
						<%-- <input type="hidden" id="percent" value="${percent}"> 
						<input type="hidden" id="status" value="${status}"> --%>
						<div id="logmsg" class="tabcontent tabnow">
							<textarea id="deplylog" style="background-color:black;width:100%;height:62vh;resize: none;color:white;">
							</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
