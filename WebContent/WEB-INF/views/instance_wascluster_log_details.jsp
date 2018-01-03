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
.inputb17{
	width:17%;display:inline-block;
}
.inputb20{
	width:20%;display:inline-block;
}
.inputb23{
	width:23%;display:inline-block;
}
#logTable3 tr {
	height: 25px;
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
	$(document).ready(function() 
	{
		giveTdColor1();//主要用于手动页面刷新
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
						maxBtn:true,
						title : '错误提示！',
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
	var type = $("#type").val().trim();
	$.ajax({
		url : '<%=path%>/nodeInstall.do',
		type : 'post',
		data : { uuid:uuid,type:type },
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

<script>
	$(document).ready(function(){
		var count = $(".wasip").length;
		for(var i=0 ; i<count; i++)
		{
			var type = $(".wasprofiletype:eq("+i+")").text().trim();
			if(type == "DMGR+AppServer")
			{
				var des = $(".wasip:eq("+i+")").text().trim();//得到主节点的IP 
				for(var j=0 ; j<count ; j++)
				{
					var mainip = $(".checkip:eq("+j+")").text().trim();
					if(des == mainip)
					{
						$(".nodes:eq("+j+")").removeClass("vicenode");
						$(".nodes:eq("+j+")").addClass("majornode");
						$(".nodes:eq("+j+")").text("主");
					}
				}
			}
		}
	})
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

						<div class="tabcontent ">
								<div class="mainmodule">									
									<h5 class="stairtit swapcon">
										拓扑结构
									</h5>
									<c:forEach items="${servers }" var="ser" varStatus="num">
										<p class="twotit" style="padding-left:0;">
											<em class="vicenode nodes">从</em>节点 <c:out value="${num.count }" />																													
										</p>
										<div class="column">
											<div class="span12">
												<p>
													<b>主机名:</b> <span class="column_txt"> ${ser.name }</span>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
													<b>IP地址:</b><span class="column_txt checkip">${ser.ip}</span>
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
											<label class="control-label">安装用户</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${was_user }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">WAS安装版本</span> 
													<span class="graytxt">${was_version }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">WAS安装路径</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${was_inst_path }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">WAS安装补丁</span> 
													<span class="graytxt">${was_fix }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">IM安装路径</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${was_im_path }</span>
												</div>
											</div>
										</div>						
									</div>
								</div>

								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>概要属性
									</h5>
									<div class="form-horizontal">
									
									<c:forEach items="${was_profile_detail }" var="sers">		   
											<div class="control-group">
												<label class="control-label">IP地址</label>
												<div class="controls">
													<div class="inputb17">
														<span class="graytxt wasip">${sers.ip }</span>
													</div>	
													<div class="inputb17">
														<span class="mr20 ">主机名</span> 
														<span class="graytxt">${sers.name }</span>
													</div>									
								 					<div class="inputb23">
														<span class="mr20 ">Profile类型</span> 
														<span class="graytxt wasprofiletype">
															<c:if test="${sers.profiletype eq 'cell'}">DMGR+AppServer</c:if>
															<c:if test="${sers.profiletype eq 'default'}">AppServer</c:if>
														</span>
													</div>
													<div class="inputb23">
														<span class="mr20 ">Profile名称</span> 
														<span class="graytxt">${sers.profilename }</span>
													</div>												
												</div>																							
											</div>
											</c:forEach>
							
										<div class="control-group">
											<label class="control-label">Profile路径</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">
														${was_profile_path }
														<%-- <c:if test="${was_profile_type eq 'cell' }">DMGR+AppServer</c:if>
														<c:if test="${was_profile_type eq 'default' }">AppServer</c:if> --%>
													</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">管理员用户</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${was_userid }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">管理员密码</span> 
													<span class="graytxt">${was_password }</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="mainmodule">
									<h5 class="swapcon">
										<i class="icon-chevron-down icon-chevron-right"></i>系统属性
									</h5>
									<div class="form-horizontal">
										<div class="control-group">
											<label class="control-label">打开文件数限制</label>
											<div class="controls">
												<div class="inputb2l">
													<span class="graytxt">${was_nofile }</span>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">用户创建进程数限制</span> 
													<span class="graytxt">${was_nproc }</span>
												</div>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">文件大小限制</label>
											<div class="controls">
												<div class="inputb2l">
													<c:if test="${was_fsize == -1 }">
														<span class="graytxt">unlimited</span>
													</c:if>
													<c:if test="${was_fsize != -1 }">
														<span class="graytxt">${was_fsize }</span>
													</c:if>
												</div>
												<div class="inputb2l">
													<span class="input140 mr20">Coredump大小限制</span> 
													<c:if test="${was_core == -1 }">
														<span class="graytxt">unlimited</span>
													</c:if>
													<c:if test="${was_core != -1 }">
														<span class="graytxt">${was_core }</span>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
						
						<input type="hidden" id="type" name="type" value="${type }">
						<input type="hidden" id="uuid" name="uuid" value="${uuid }">
						<input type="hidden" id="percent" value="${percent}"> 
						<input type="hidden" id="status" value="${status}">
						<div id="logmsg" class="tabcontent tabnow">
							<textarea style="background-color:black;width:100%;height:62vh;resize: none;color:white;">
							</textarea> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
