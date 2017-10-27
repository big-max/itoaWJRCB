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
.current1,.current1:hover {
    color: #444444;
}
.mr20,.ftSi{
	font-size:14px;
}
.modelcontent{
	padding-top: 5px;width:450px;margin:0 auto;
}
</style>
<script>
	$(document).ready(function() {
		(function($) {
			$('#filter').keyup(function() {
				var rex = new RegExp($(this).val(), 'i');
				$('.searchable tr').hide();
				$('.searchable tr').filter(function() {
					return rex.test($(this).text());
				}).show();
			})
		}(jQuery));
	});
	
	function sweet(te,ty,conBut)
	{
		swal({ title: "", text: te,  type: ty, confirmButtonText: conBut, });
	}
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
			<a href="" class="current" style="position:relative;top:-3px;">
				<i class="icon-home"></i>实例一览
			</a>
			<a href="#" class="current1" style="position:relative;top:-3px;">IBM 安全加固</a>
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
							<div class="widget-content">安全加固概要信息.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="columnauto">
						<div class="widget-box nostyle">
							<div class="col-sm-6 form-inline">
								<input id="filter" type="text" class="form-control" placeholder="请输入过滤项" style="height:30px;">
								<span style="margin-right: 4px;"></span>
								<button onclick="enforceBtn()" class="btn btn-sm" data-toggle="modal" data-target="#securityenforce" style="background-color: #448FC8;">
									<font color="white">安全加固</font>
								</button>
								<span style="margin-right: 4px;"></span>
								<button onclick="checkBtn()" class="btn btn-sm" data-toggle="modal" data-target="#securitycheck" style="background-color: #448FC8;">
									<font color="white">安全检测</font>
								</button>
							</div>

							<div style="margin-bottom: 10px;"></div>
							<table id="sel_tab"
								class="table table-bordered data-table with-check table-hover no-search no-select">
								<thead>
									<tr>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">对象</th>
										<th style="text-align: center;">执行时间</th>
										<th style="text-align: center;">任务类型</th>
										<th style="text-align: center;">安全模板</th>
										<th style="text-align: center;">执行人</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>

								<tbody class="searchable">
									 <c:forEach items="${securityJobs }" var="job" varStatus="status">
										<tr>
											<td style="text-align: center;"><input type="checkbox" name="servers"
													value="${job.id }" onclick="isSelect(this);" /></td>
											<td style="text-align: center;"><c:forEach items="${job.ip_list }" var="ip" varStatus="status">
												${ip} &nbsp;
											</c:forEach>
											</td>									
											<td style="text-align: center;">${job.exectime }</td>
											<td style="text-align: center;">${job.job_type == 0 ? "安全检测" : "安全加固" }</td>
											<td style="text-align: center;">${job.security_template }</td>
											<td style="text-align: center;">${job.user }</td>
											<td style="text-align: center;"><a href="${job.summary}" style="color:#08c;">详情</a></td>
										</tr>
									</c:forEach> 
								</tbody>
							</table>
							
							
							<!-- 模态框：安全加固 -->
							<div class="modal fade" id="securityenforce" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- 头部 -->
										<div class="modal-header">
											<h5 class="modal-title" id="myModalLabel">
												<img src="<%=path%>/img/plus15.png">&nbsp;&nbsp;安全加固
											</h5>
										</div>
										<!-- 主体内容 -->
										<form id="submits_securityenforce">
											<div class="modal-body">
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">IP：</span>
														<select id="ip_list" multiple="multiple" name="ip_list" class="w85" style="width: 220px;">									
														</select>
													</div>
												</div>																																	
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">安全模板：</span>
														<select id="security_template" name="security_template" class="w85" style="width: 220px;">
															<option value="Template1">Template1</option>
														</select>
													</div>
												</div>					
											</div>
										</form>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
										<button type="button" class="btn" style="background-color: #448FC8;" onclick="CheckInputEnforce();">
											<font color="white">提交</font>
										</button>
									</div>
								</div>
							</div>
							<!-- 模态框：安全加固 -->
							
							<!-- 模态框：安全检测 -->
							<div class="modal fade" id="securitycheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- 头部 -->
										<div class="modal-header">
											<h5 class="modal-title" id="myModalLabel">
												<img src="<%=path%>/img/plus15.png">&nbsp;&nbsp;安全检测
											</h5>
										</div>
										<!-- 主体内容 -->
										<form id="submits_securitycheck">
											<div class="modal-body">
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">IP：</span>
														<select id="iplist_check" multiple="multiple" name="iplist_check" class="w85" style="width: 220px;">															
														</select>
													</div>
												</div>																																	
												<div class="control-group">
													<div class="controls modelcontent">
														<span class="input140 mr20">安全模板：</span>
														<select id="template_check" name="template_check" class="w85" style="width: 220px;">
															<option value="Template1">Template1</option>
														</select>
													</div>
												</div>									
											</div>
										</form>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal();">关闭</button>
										<button type="button" class="btn" style="background-color: #448FC8;" onclick="CheckInput();">
											<font color="white">提交</font>
										</button>
									</div>
								</div>
							</div>
							<!-- 模态框：安全检测 -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>

<script>	
	//点击“安全加固”按钮获取所有主机IP
	function enforceBtn()
	{
		$.ajax({
			url:"<%=path%>/getAllips.do",    //ServerController.java
			type : 'get',
			dataType : 'json',
			success:function(result)
			{
				var str;
				for (var i = 0; i < result.length; i++) 
				{					
					str += "<option value='" + result[i] + "'>" + result[i]+ "</option>";
				}	
				$("#ip_list").append(str); 	
			},
			failure:function(errmsg)
			{
				alert(errmsg)
			}
		})
	}
	
	//点击“安全检测”按钮获取所有主机IP
	function checkBtn()
	{
 		$.ajax({
			url:"<%=path%>/getAllips.do",
			type : 'get',
			dataType : 'json',
			success:function(result)
			{
				var str;
				for (var i = 0; i < result.length; i++) 
				{					
					str += "<option value='" + result[i] + "'>" + result[i]+ "</option>";
				}	
				$("#iplist_check").append(str); 	
			},
			failure:function(errmsg)
			{
				alert(errmsg)
			}
		}) 
	}
</script>

<script>
	//点击“安全加固”模态框的提交按钮，发送ajax请求
	function CheckInputEnforce()
	{
		var target_ips = "";
		var ip_list = $("#ip_list").val();
		for(var i=0; i<ip_list.length; i++){
			target_ips += ip_list[i]+",";
		}
		var security_template = $("#security_template").val();
		var job_type = 1;
		if(ip_list == null)
		{
			sweet("请选择IP","warning","确定"); 
        	return;
		}
		var datas = {
				"ip_list": target_ips,
				"security_template":security_template,
				"job_type":job_type
		};//这里发送后端需要的字段 
		$.ajax({
			url:"<%=path%>/addSecurityJob.do",
			type : 'post',
			dataType : 'json',
			data:datas,
			success:function(result){
				swal({
					title : "",
					text : "确认是否对此IP进行安全加固？",
					type : "warning",
					showCancelButton : true,
					closeOnConfirm : false,
					closeOnCancel : false,
					confirmButtonText : "是",
					cancelButtonText : "否", 
					confirmButtonColor : "#ec6c62"
				}, function(isConfirm) {
					if (isConfirm) {
						window.location.href = "getAllsecurityJobs.do";
					} else {
						window.history.go(0);
					}
				});
			},
			failure:function(errmsg)
			{
				alert(errmsg)
			}
		})
	}
	//点击“安全检查”模态框的提交按钮，发送ajax请求
	function CheckInput()
	{
		var target_ips = "";
		var ip_list = $("#iplist_check").val();
		for(var i=0; i<ip_list.length; i++){
			target_ips += ip_list[i]+",";
		}
		var security_template = $("#template_check").val();
		var job_type = 0;
		if(ip_list == null)
		{
			sweet("请选择IP","warning","确定"); 
        	return;
		}

		var datas = {
				"ip_list": target_ips,
				"security_template":security_template,
				"job_type":job_type
		};//这里发送后端需要的字段 

		$.ajax({
			url:"<%=path%>/addSecurityJob.do",
			type : 'post',
			dataType : 'json',
			data:datas,
			success:function(result){
				swal({
					title : "",
					text : "确认是否对此IP进行安全检测？",
					type : "warning",
					showCancelButton : true,
					closeOnConfirm : false,
					closeOnCancel : false,
					confirmButtonText : "是",
					cancelButtonText : "否", 
					confirmButtonColor : "#ec6c62"
				}, function(isConfirm) {
					if (isConfirm) {
						window.location.href = "getAllsecurityJobs.do";
					} else {
						window.history.go(0);
					}
				});
			},
			failure:function(errmsg)
			{
				alert(errmsg)
			}
		})
	}
	
	function closeModal()  
	{
		window.location.href = "getAllsecurityJobs.do";
	}
</script>
</html>